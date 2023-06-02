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
      ExplicitLeft = 0
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
        Top = 117
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
      object Label5: TLabel
        Left = 15
        Top = 173
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
        Left = 15
        Top = 229
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
        Left = 209
        Top = 61
        Width = 60
        Height = 17
        Caption = 'Tradu'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        StyleElements = [seClient, seBorder]
      end
      object Label9: TLabel
        Left = 209
        Top = 173
        Width = 60
        Height = 17
        Caption = 'Tradu'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        StyleElements = [seClient, seBorder]
      end
      object Label10: TLabel
        Left = 210
        Top = 230
        Width = 60
        Height = 17
        Caption = 'Tradu'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        StyleElements = [seClient, seBorder]
      end
      object Label8: TLabel
        Left = 210
        Top = 118
        Width = 60
        Height = 17
        Caption = 'Tradu'#231#245'es'
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
        TabOrder = 9
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
        Top = 296
        Width = 118
        Height = 35
        Caption = 'Procurar'
        TabOrder = 8
        StyleName = 'Tablet Light'
        OnClick = btnProcurarClick
      end
      object edtPalavra1: TEdit
        Left = 15
        Top = 82
        Width = 185
        Height = 23
        ImeName = 'Portuguese (Brazilian ABNT)'
        TabOrder = 0
      end
      object edtPalavra2: TEdit
        Left = 15
        Top = 138
        Width = 185
        Height = 23
        TabOrder = 2
      end
      object edtPalavra3: TEdit
        Left = 15
        Top = 194
        Width = 185
        Height = 23
        TabOrder = 4
      end
      object edtPalavra4: TEdit
        Left = 15
        Top = 250
        Width = 185
        Height = 23
        TabOrder = 6
      end
      object ComboBox1: TComboBox
        Left = 209
        Top = 82
        Width = 119
        Height = 23
        Style = csDropDownList
        ImeName = 'cbxLinguagens'
        ItemIndex = 0
        TabOrder = 1
        Text = 'Nenhum'
        Items.Strings = (
          'Nenhum'
          'Ingl'#234's'
          'Espanhol '
          'Italiano'
          'Franc'#234's'
          'Russo')
      end
      object ComboBox3: TComboBox
        Left = 209
        Top = 194
        Width = 119
        Height = 23
        Style = csDropDownList
        ImeName = 'cbxLinguagens'
        ItemIndex = 0
        TabOrder = 5
        Text = 'Nenhum'
        Items.Strings = (
          'Nenhum'
          'Ingl'#234's'
          'Espanhol '
          'Italiano'
          'Franc'#234's'
          'Russo')
      end
      object ComboBox4: TComboBox
        Left = 210
        Top = 251
        Width = 119
        Height = 23
        Style = csDropDownList
        ImeName = 'cbxLinguagens'
        ItemIndex = 0
        TabOrder = 7
        Text = 'Nenhum'
        Items.Strings = (
          'Nenhum'
          'Ingl'#234's'
          'Espanhol '
          'Italiano'
          'Franc'#234's'
          'Russo')
      end
      object ComboBox2: TComboBox
        Left = 210
        Top = 139
        Width = 119
        Height = 23
        Style = csDropDownList
        ImeName = 'cbxLinguagens'
        ItemIndex = 0
        TabOrder = 3
        Text = 'Nenhum'
        Items.Strings = (
          'Nenhum'
          'Ingl'#234's'
          'Espanhol '
          'Italiano'
          'Franc'#234's'
          'Russo')
      end
      object pnLog: TPanel
        Left = 1
        Top = 374
        Width = 356
        Height = 263
        Align = alBottom
        Caption = 'pnLog'
        ShowCaption = False
        TabOrder = 10
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
          ExplicitLeft = 0
          ExplicitTop = 222
          ExplicitWidth = 356
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
          Height = 215
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
        end
      end
      object ckbDestacar: TCheckBox
        Left = 15
        Top = 304
        Width = 161
        Height = 17
        Caption = 'Destacar Ocorr'#234'ncias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
      end
    end
  end
end
