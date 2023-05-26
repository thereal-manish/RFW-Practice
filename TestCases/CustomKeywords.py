import xlwings as xw
from robot.api.deco import keyword

@keyword("Set Cell Background Color")
def set_cell_background_color(workbook, sheet_name, cell, color):
    # Open the workbook and select the specified sheet
    wb = xw.Book(workbook)
    sheet = wb.sheets[sheet_name]

    # Set the background color of the specified cell
    sheet.range(cell).color = color

    # Save the workbook
    wb.save()
