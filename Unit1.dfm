object Form1: TForm1
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 562
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 0
    Top = 0
    Width = 481
    Height = 217
    DefaultColWidth = 80
    DefaultRowHeight = 25
    FixedCols = 0
    RowCount = 8
    FixedRows = 0
    TabOrder = 0
  end
  object Button1: TButton
    Left = 487
    Top = 0
    Width = 75
    Height = 25
    Caption = 'Fill in'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 487
    Top = 31
    Width = 75
    Height = 25
    Caption = 'Process'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 487
    Top = 62
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 3
    OnClick = Button3Click
  end
  object StringGrid2: TStringGrid
    Left = 0
    Top = 223
    Width = 481
    Height = 218
    DefaultColWidth = 80
    DefaultRowHeight = 25
    FixedCols = 0
    RowCount = 8
    FixedRows = 0
    TabOrder = 4
  end
  object OpenDialog1: TOpenDialog
    Left = 576
    Top = 8
  end
  object SaveDialog1: TSaveDialog
    Left = 608
    Top = 8
  end
end
