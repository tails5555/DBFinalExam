package net.exam.mentoring.service;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.exam.mentoring.dto.Mento;
import net.exam.mentoring.mapper.MentoMapper;

@Service
public class ExcelService {
	@Autowired MentoMapper mentoMapper;
	CellStyle createDateStyle(Workbook workbook, String dateFormat) {
		CellStyle style = workbook.createCellStyle();
		CreationHelper createHelper = workbook.getCreationHelper();
		style.setDataFormat(createHelper.createDataFormat().getFormat(dateFormat));
		return style;
	}
	public Workbook createXLSX() {
		XSSFWorkbook workbook=new XSSFWorkbook();
		XSSFSheet sheet=workbook.createSheet();
		int rowCount=0;
		Row row=sheet.createRow(rowCount++);
		row.createCell(0).setCellValue("팀 이름");
		row.createCell(1).setCellValue("멘토 이름");
		row.createCell(2).setCellValue("과목");
		row.createCell(3).setCellValue("등록 날짜");
		sheet.setColumnWidth(0, 30*256);
		sheet.setColumnWidth(1, 12*256);
		sheet.setColumnWidth(2, 24*256);
		sheet.setColumnWidth(3, 11*256);
		CellStyle dateStyle=createDateStyle(workbook, "yyyy-MM-dd");

		for(Mento mento : mentoMapper.findAll()) {
			row=sheet.createRow(rowCount++);
			row.createCell(0).setCellValue(mento.getTeamName());
			row.createCell(1).setCellValue(mento.getMentoName());
			row.createCell(2).setCellValue(mento.getSubject());
			row.createCell(3).setCellValue(mento.getApplicationDate());
			row.getCell(3).setCellStyle(dateStyle);
		}
		return workbook;
	}
}
