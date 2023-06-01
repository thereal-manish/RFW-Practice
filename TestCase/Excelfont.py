from openpyxl.styles import Font 
from openpyxl import load_workbook

class ExcelLibrary:

    def set_cell_text_color(self,TestCase/EmployeeDatas.xlsx,EmployeeDetails,5, Red):
        workbook = load_workbook("TestCase/EmployeeDatas.xlsx")
        sheet = workbook["EmployeeDetails"]
        cell_obj = sheet[5]
        font = Font("Red")
        cell_obj.font = font
        workbook.save("EmployeeDatas.xlsx")
