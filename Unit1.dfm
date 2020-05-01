object Form1: TForm1
  Left = 192
  Top = 117
  Width = 855
  Height = 654
  Caption = 'Editor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 847
    Height = 49
    Align = alTop
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 16
      Top = 8
      Width = 49
      Height = 33
      Caption = 'Yeni'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = Yeni1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 72
      Top = 8
      Width = 49
      Height = 33
      Caption = 'A'#231
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = A1Click
    end
    object SpeedButton3: TSpeedButton
      Left = 128
      Top = 8
      Width = 49
      Height = 33
      Caption = 'Kaydet'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = FarklKaydet1Click
    end
    object SpeedButton4: TSpeedButton
      Left = 184
      Top = 8
      Width = 49
      Height = 33
      Caption = 'Bul'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = Bul1Click
    end
    object SpeedButton5: TSpeedButton
      Left = 240
      Top = 8
      Width = 57
      Height = 33
      Caption = 'De'#287'i'#351'tir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = Deitir1Click
    end
    object SpeedButton6: TSpeedButton
      Left = 304
      Top = 8
      Width = 49
      Height = 33
      Caption = 'Font'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = Font1Click
    end
    object SpeedButton7: TSpeedButton
      Left = 360
      Top = 8
      Width = 49
      Height = 33
      Caption = 'Renk'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = Renk1Click
    end
    object SpeedButton8: TSpeedButton
      Left = 416
      Top = 8
      Width = 49
      Height = 33
      Caption = 'Yard'#305'm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = Yeni1Click
    end
    object SpeedButton9: TSpeedButton
      Left = 784
      Top = 8
      Width = 49
      Height = 33
      Caption = 'Yazd'#305'r'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = Yazdr1Click
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 49
    Width = 847
    Height = 554
    Align = alClient
    PopupMenu = PopupMenu1
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object MainMenu1: TMainMenu
    Left = 584
    Top = 24
    object Dosya1: TMenuItem
      Caption = 'Dosya'
      object Yeni1: TMenuItem
        Caption = 'Yeni'
        OnClick = Yeni1Click
      end
      object A1: TMenuItem
        Caption = 'A'#231
        OnClick = A1Click
      end
      object Kaydet1: TMenuItem
        Caption = 'Kaydet'
      end
      object FarklKaydet1: TMenuItem
        Caption = 'Farkl'#305' Kaydet'
        OnClick = FarklKaydet1Click
      end
      object Kapatl1: TMenuItem
        Caption = 'Kapat'
        OnClick = Kapatl1Click
      end
      object N1: TMenuItem
        Caption = '________________'
        Enabled = False
      end
      object Yazdr1: TMenuItem
        Caption = 'Yazd'#305'r'
        OnClick = Yazdr1Click
      end
    end
    object Edit1: TMenuItem
      Caption = 'D'#252'zenle'
      object Kes1: TMenuItem
        Caption = 'Kes'
      end
      object Kopyala1: TMenuItem
        Caption = 'Kopyala'
      end
      object Yaptr1: TMenuItem
        Caption = 'Yap'#305#351't'#305'r'
      end
      object Sil1: TMenuItem
        Caption = 'Sil'
        OnClick = Sil1Click
      end
    end
    object Ara1: TMenuItem
      Caption = 'Ara'
      object Bul1: TMenuItem
        Caption = 'Bul'
        OnClick = Bul1Click
      end
      object Deitir1: TMenuItem
        Caption = 'De'#287'i'#351'tir'
        OnClick = Deitir1Click
      end
    end
    object Biim1: TMenuItem
      Caption = 'Bi'#231'im'
      object Font1: TMenuItem
        Caption = 'Font'
        OnClick = Font1Click
      end
      object Renk1: TMenuItem
        Caption = 'Renk'
        OnClick = Renk1Click
      end
    end
    object Yardm1: TMenuItem
      Caption = 'Yard'#305'm'
      object Hakknda1: TMenuItem
        Caption = 'Hakk'#305'nda'
        OnClick = Hakknda1Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'metin |*.txt|t'#252'm dosyalar|*.*'
    Left = 552
    Top = 24
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Metin|*.txt|T'#252'm Dosyalar |*.*'
    Left = 744
    Top = 8
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 712
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    Left = 680
    Top = 8
    object Kes2: TMenuItem
      Caption = 'Kes '
      OnClick = Kes2Click
    end
    object Kopyala2: TMenuItem
      Caption = 'Kopyala'
      OnClick = Kopyala2Click
    end
    object Yaptr2: TMenuItem
      Caption = 'Yap'#305#351't'#305'r'
      OnClick = Yaptr2Click
    end
  end
  object ColorDialog1: TColorDialog
    Left = 648
    Top = 8
  end
  object PrintDialog1: TPrintDialog
    Left = 616
    Top = 8
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 584
    Top = 8
  end
  object FindDialog1: TFindDialog
    OnFind = FindDialog1Find
    Left = 552
    Top = 8
  end
  object ReplaceDialog1: TReplaceDialog
    OnFind = ReplaceDialog1Find
    OnReplace = ReplaceDialog1Replace
    Left = 520
    Top = 8
  end
end
