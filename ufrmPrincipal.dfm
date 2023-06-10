object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Ocurrence Finder'
  ClientHeight = 640
  ClientWidth = 850
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OnCreate = FormCreate
  TextHeight = 15
  object pnBusca: TPanel
    Left = 0
    Top = 0
    Width = 850
    Height = 640
    Align = alClient
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 844
    ExplicitHeight = 634
    object pnTextoBase: TPanel
      Left = 359
      Top = 1
      Width = 490
      Height = 638
      Align = alRight
      Color = 11579568
      ParentBackground = False
      ShowCaption = False
      TabOrder = 0
      StyleElements = [seFont, seClient]
      ExplicitLeft = 353
      ExplicitHeight = 632
      object pnTextoBaseHeader: TPanel
        AlignWithMargins = True
        Left = 1
        Top = 1
        Width = 488
        Height = 41
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        Color = 16419907
        ParentBackground = False
        ShowCaption = False
        TabOrder = 2
        StyleElements = [seFont, seBorder]
        object Label1: TLabel
          AlignWithMargins = True
          Left = 11
          Top = 8
          Width = 71
          Height = 23
          Margins.Left = 10
          Margins.Top = 7
          Margins.Bottom = 9
          Align = alLeft
          Caption = 'Texto Base'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          StyleElements = [seClient, seBorder]
          ExplicitHeight = 21
        end
      end
      object mmRichEdit: TRichEdit
        AlignWithMargins = True
        Left = 6
        Top = 47
        Width = 478
        Height = 514
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 0
        Align = alTop
        Color = 15066597
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ImeName = 'Portuguese (Brazilian ABNT)'
        ParentFont = False
        TabOrder = 0
        StyleElements = [seFont, seBorder]
      end
      object btnClear: TButton
        AlignWithMargins = True
        Left = 141
        Top = 581
        Width = 208
        Height = 36
        Margins.Left = 140
        Margins.Top = 20
        Margins.Right = 140
        Margins.Bottom = 20
        Align = alClient
        Caption = 'Limpar'
        DisabledImageName = 'btnClear'
        TabOrder = 1
        StyleName = 'Tablet Light'
        OnClick = btnClearClick
        ExplicitHeight = 30
      end
    end
    object pnConfigs: TPanel
      Left = 1
      Top = 1
      Width = 358
      Height = 638
      Align = alClient
      Color = 12698049
      ParentBackground = False
      ShowCaption = False
      TabOrder = 1
      StyleElements = [seFont, seClient]
      ExplicitWidth = 352
      ExplicitHeight = 632
      object Label3: TLabel
        Left = 15
        Top = 61
        Width = 81
        Height = 17
        Caption = 'Palavra Chave'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        StyleElements = [seClient, seBorder]
      end
      object Label4: TLabel
        Left = 15
        Top = 141
        Width = 81
        Height = 17
        Caption = 'Palavra Chave'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        StyleElements = [seClient, seBorder]
      end
      object Label7: TLabel
        Left = 219
        Top = 61
        Width = 85
        Height = 17
        Caption = 'Tradu'#231#227'o para'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        StyleElements = [seClient, seBorder]
      end
      object Label8: TLabel
        Left = 220
        Top = 142
        Width = 85
        Height = 17
        Caption = 'Tradu'#231#227'o para'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        StyleElements = [seClient, seBorder]
      end
      object Label5: TLabel
        Left = 15
        Top = 222
        Width = 81
        Height = 17
        Caption = 'Palavra Chave'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        StyleElements = [seClient, seBorder]
      end
      object Label6: TLabel
        Left = 220
        Top = 223
        Width = 85
        Height = 17
        Caption = 'Tradu'#231#227'o para'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        StyleElements = [seClient, seBorder]
      end
      object Panel1: TPanel
        AlignWithMargins = True
        Left = 1
        Top = 1
        Width = 356
        Height = 41
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        Color = 16419907
        ParentBackground = False
        ShowCaption = False
        TabOrder = 5
        StyleElements = [seFont, seBorder]
        ExplicitWidth = 350
        object Label2: TLabel
          AlignWithMargins = True
          Left = 11
          Top = 8
          Width = 100
          Height = 23
          Margins.Left = 10
          Margins.Top = 7
          Margins.Bottom = 9
          Align = alLeft
          Caption = 'Configura'#231#245'es'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          StyleElements = [seClient, seBorder]
          ExplicitHeight = 21
        end
      end
      object btnProcurar: TButton
        Left = 209
        Top = 320
        Width = 118
        Height = 35
        Caption = 'Procurar'
        TabOrder = 4
        StyleName = 'Tablet Light'
        OnClick = btnProcurarClick
      end
      object edtPalavra1: TEdit
        Left = 15
        Top = 82
        Width = 195
        Height = 23
        ImeName = 'Portuguese (Brazilian ABNT)'
        TabOrder = 0
        OnChange = edtPalavra1Change
      end
      object edtPalavra2: TEdit
        Left = 15
        Top = 162
        Width = 195
        Height = 23
        TabOrder = 2
        OnChange = edtPalavra2Change
      end
      object cbxtraducao1: TComboBox
        Left = 219
        Top = 82
        Width = 119
        Height = 23
        Style = csDropDownList
        ImeName = 'Portuguese (Brazilian ABNT)'
        ItemIndex = 0
        TabOrder = 1
        Text = 'Nenhum'
        OnChange = cbxtraducao1Change
        Items.Strings = (
          'Nenhum'
          'Ingl'#234's'
          'Chin'#234's'
          'Franc'#234's'
          'Alem'#227'o'
          'Italiano'
          'Portugu'#234's'
          'Russo')
      end
      object cbxtraducao2: TComboBox
        Left = 220
        Top = 163
        Width = 119
        Height = 23
        Style = csDropDownList
        ImeName = 'cbxLinguagens'
        ItemIndex = 0
        TabOrder = 3
        Text = 'Nenhum'
        OnChange = cbxtraducao2Change
        Items.Strings = (
          'Nenhum'
          'Ingl'#234's'
          'Chin'#234's'
          'Franc'#234's'
          'Alem'#227'o'
          'Italiano'
          'Portugu'#234's'
          'Russo')
      end
      object pnLog: TPanel
        Left = 1
        Top = 400
        Width = 356
        Height = 237
        Align = alBottom
        Caption = 'pnLog'
        ShowCaption = False
        TabOrder = 6
        object Panel2: TPanel
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 354
          Height = 41
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          Color = 16419907
          ParentBackground = False
          ShowCaption = False
          TabOrder = 0
          StyleElements = [seFont, seBorder]
          ExplicitWidth = 348
          object Label11: TLabel
            AlignWithMargins = True
            Left = 11
            Top = 8
            Width = 26
            Height = 23
            Margins.Left = 10
            Margins.Top = 7
            Margins.Bottom = 9
            Align = alLeft
            Caption = 'Log'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            StyleElements = [seClient, seBorder]
            ExplicitHeight = 21
          end
        end
        object mmLog: TRichEdit
          AlignWithMargins = True
          Left = 6
          Top = 47
          Width = 344
          Height = 189
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 0
          Align = alClient
          Color = 15066597
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ImeName = 'Portuguese (Brazilian ABNT)'
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 1
          StyleElements = [seFont, seBorder]
          ExplicitWidth = 338
          ExplicitHeight = 215
        end
      end
      object ckbDestacar: TCheckBox
        Left = 15
        Top = 320
        Width = 161
        Height = 17
        Caption = 'Destacar Ocorr'#234'ncias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object ckbCaseSensititve: TCheckBox
        Left = 15
        Top = 352
        Width = 161
        Height = 17
        Caption = 'Case Sensitive'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object edtTraducao1: TEdit
        Left = 15
        Top = 111
        Width = 195
        Height = 23
        Enabled = False
        ImeName = 'Portuguese (Brazilian ABNT)'
        TabOrder = 9
      end
      object edtTraducao2: TEdit
        Left = 15
        Top = 190
        Width = 195
        Height = 23
        TabOrder = 10
      end
      object edtPalavra3: TEdit
        Left = 15
        Top = 243
        Width = 195
        Height = 23
        ImeName = 'Portuguese (Brazilian ABNT)'
        TabOrder = 11
        OnChange = edtPalavra3Change
      end
      object cbxTraducao3: TComboBox
        Left = 220
        Top = 244
        Width = 119
        Height = 23
        Style = csDropDownList
        ImeName = 'Portuguese (Brazilian ABNT)'
        ItemIndex = 0
        TabOrder = 12
        Text = 'Nenhum'
        OnChange = cbxTraducao3Change
        Items.Strings = (
          'Nenhum'
          'Ingl'#234's'
          'Chin'#234's'
          'Franc'#234's'
          'Alem'#227'o'
          'Italiano'
          'Portugu'#234's'
          'Russo')
      end
      object edtTraducao3: TEdit
        Left = 15
        Top = 271
        Width = 195
        Height = 23
        TabOrder = 13
      end
    end
  end
end
