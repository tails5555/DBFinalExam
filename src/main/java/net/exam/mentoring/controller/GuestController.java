package net.exam.mentoring.controller;

import java.io.InputStream;
import java.math.BigDecimal;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.extractor.XSSFExcelExtractor;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import net.exam.mentoring.dto.Student;
import net.exam.mentoring.dto.User;
import net.exam.mentoring.model.Pagination;
import net.exam.mentoring.service.DepartmentService;
import net.exam.mentoring.service.StudentService;
import net.exam.mentoring.service.UserService;

@Controller
public class GuestController {
	@Autowired UserService userService;
	@Autowired DepartmentService departmentService;
	@Autowired StudentService studentService;
	@RequestMapping({"/", "guest/index"})
	public String index() {
		return "guest/index";
	}
	@RequestMapping("guest/login")
	public String login() {
		return "guest/login";
	}
	@RequestMapping("guest/userList")
	public String userList(Model model, Pagination pagination) {
		model.addAttribute("users", userService.findAll(pagination));
		model.addAttribute("searchBy", userService.getSearchBy());
		model.addAttribute("orderBy", userService.getOrderBy());
		return "guest/userList";
	}
	@RequestMapping("guest/userView")
	public String userView(Model model, @RequestParam("id") int id, Pagination pagination) {
		User user=userService.findOne(id);
		model.addAttribute("student", user);
		return "guest/userView";
	}
	@RequestMapping(value="guest/userApplication")
	public String userApplication(Model model) {
		return "guest/userApplication";
	}


	@RequestMapping(value="guest/excelUpload")
	public String userApplication(@RequestParam("uploadFile") MultipartFile upload) {
		if(upload.getSize()<=0) return "redirect:userApplication";
		try {
			InputStream is = upload.getInputStream();
    		XSSFWorkbook wb=new XSSFWorkbook(is);
    		XSSFExcelExtractor extractor=new XSSFExcelExtractor(wb);
    		extractor.setFormulasNotResults(false);
    		extractor.setIncludeSheetNames(false);
    		System.out.println(extractor.getText());
    		Sheet studentSheet=wb.getSheetAt(0);
    		int rowCount=studentSheet.getPhysicalNumberOfRows();
    		for(int k=1;k<rowCount;k++) {
    			Row row=studentSheet.getRow(k);
    			Student student=new Student();
    			Cell cell01=row.getCell(0);
    			student.setDepartmentId(departmentService.findByDepartmentName(cell01.getRichStringCellValue().toString()));
    			Cell cell02=row.getCell(1);
    			BigDecimal stdNum=new BigDecimal(cell02.getNumericCellValue());
    			student.setStudentNumber(stdNum.toString());
    			Cell cell03=row.getCell(2);
    			student.setName(cell03.getRichStringCellValue().toString());
    			Cell cell04=row.getCell(3);
    			student.setGrade(Integer.valueOf(cell04.getRichStringCellValue().toString()));
    			Cell cell05=row.getCell(4);
    			student.setPhoneNumber(cell05.getRichStringCellValue().toString());
    			Cell cell06=row.getCell(5);
    			student.setEmail(cell06.getRichStringCellValue().toString());
    			studentService.insert(student);
    		}
		}catch(Exception e){
            e.printStackTrace();
		}
		return "redirect:userList?pg=1";
	}

    @RequestMapping(value="guest/delete")
    public String delete(Model model, @RequestParam("id") int id,Pagination pagination) {
        studentService.delete(id);
        return "redirect:userList?pg=1";
    }

}
