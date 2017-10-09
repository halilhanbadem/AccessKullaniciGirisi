object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'DelphiCan - Kullanici Giris Ornegi'
  ClientHeight = 221
  ClientWidth = 695
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 68
    Top = 45
    Width = 172
    Height = 13
    Caption = 'Kullanici Ad'#305' veya Telefon Numaras'#305':'
  end
  object Label2: TLabel
    Left = 68
    Top = 90
    Width = 73
    Height = 13
    Caption = 'Kullan'#305'c'#305' '#350'ifresi:'
  end
  object Edit1: TEdit
    Left = 68
    Top = 61
    Width = 197
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 68
    Top = 104
    Width = 197
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 68
    Top = 139
    Width = 197
    Height = 25
    Caption = 'Giri'#351' Yap'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Baglanti: TUniConnection
    Left = 416
    Top = 80
  end
  object Provider: TAccessUniProvider
    Left = 472
    Top = 80
  end
  object Sorgu: TUniQuery
    Connection = Baglanti
    Left = 520
    Top = 80
  end
end
