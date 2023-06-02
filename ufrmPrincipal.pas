unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Imaging.jpeg, Vcl.WinXPanels, Vcl.Mask, uAhoCorasick, Vcl.OleCtrls,
  SHDocVw;

type
  TfrmPrincipal = class(TForm)
    pnBusca: TPanel;
    pnTextoBase: TPanel;
    pnTextoBaseHeader: TPanel;
    Label1: TLabel;
    pnConfigs: TPanel;
    Panel1: TPanel;
    Label2: TLabel;
    btnProcurar: TButton;
    Label3: TLabel;
    edtPalavra1: TEdit;
    Label4: TLabel;
    edtPalavra2: TEdit;
    Label5: TLabel;
    edtPalavra3: TEdit;
    mmRichEdit: TRichEdit;
    Label6: TLabel;
    edtPalavra4: TEdit;
    btnClear: TButton;
    Label7: TLabel;
    ComboBox1: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox2: TComboBox;
    Label9: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    pnLog: TPanel;
    Panel2: TPanel;
    Label11: TLabel;
    mmLog: TRichEdit;
    ckbDestacar: TCheckBox;
    procedure btnProcurarClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure HighLightWords(const text: string; const matchResults: TArray<TMatchResult>);
    procedure FindAndHighlightWord(RichEdit: TRichEdit; const SearchWord: string);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnClearClick(Sender: TObject);
begin
  mmRichEdit.Clear;
  mmLog.Clear;
  pnLog.Visible := False;
end;

procedure TfrmPrincipal.btnProcurarClick(Sender: TObject);
var
  AhoCorasick: TAhoCorasick;
  Matches: TArray<TMatchResult>;
  i: Integer;
begin
  if(mmRichEdit.Text = '') then
  begin
    ShowMessage('� necess�rio um texto base para poder prosseguir!')
  end else
  begin
    AhoCorasick := TAhoCorasick.Create;

    mmRichEdit.SelectAll;
    mmRichEdit.SelAttributes := mmRichEdit.DefAttributes;

    try
      // Adiciona as palavras chaves
      if edtPalavra1.Text <> EmptyStr then
        AhoCorasick.AddWord(edtPalavra1.Text);

      if edtPalavra2.Text <> EmptyStr then
        AhoCorasick.AddWord(edtPalavra2.Text);

      if edtPalavra3.Text <> EmptyStr then
        AhoCorasick.AddWord(edtPalavra3.Text);

      if edtPalavra4.Text <> EmptyStr then
        AhoCorasick.AddWord(edtPalavra4.Text);

      // Construa a estrutura de busca
      AhoCorasick.Build;

      // Realize a busca no texto
      Matches := AhoCorasick.FindWords(mmRichEdit.Text);
      //HighLightWords(mmRichEdit.Text, Matches);

      // Exibe as palavras encontradas no log
      if Length(Matches) > 0 then
      begin
        mmLog.Clear;
        pnLog.Visible := True;

        for i := 0 to Length(Matches) - 1 do
        begin
          if ckbDestacar.Checked then
          begin
            FindAndHighlightWord(mmRichEdit, Matches[i].Word);
          end;

          mmLog.Lines.Add(Format('--Palavra encontrada: "%s" (Posi��o: %d)', [Matches[i].Word, Matches[i].Position]));

        end;
      end else
      begin
        ShowMessage('Nenhuma ocorr�ncia encontrada!');
      end;

    finally
      AhoCorasick.Free;
      mmLog.Refresh;
    end;
  end;
end;

procedure TfrmPrincipal.FindAndHighlightWord(RichEdit: TRichEdit;
  const SearchWord: string);
var
  StartPos, FoundPos: Integer;
begin
  // Inicia a busca a partir do in�cio do texto
  StartPos := 0;

  // Percorre o texto do RichEdit em busca da palavra
  repeat
    FoundPos := RichEdit.FindText(SearchWord, StartPos, Length(RichEdit.Text), []);

    // Se a palavra for encontrada, altera a cor de fundo
    if FoundPos >= 0 then
    begin
      RichEdit.SelStart := FoundPos;
      RichEdit.SelLength := Length(SearchWord);
      RichEdit.SelAttributes.BackColor := clYellow;
      RichEdit.Refresh;

      // Move a posi��o inicial para continuar a busca
      StartPos := FoundPos + Length(SearchWord);
    end;
  until FoundPos < 0;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  pnLog.Visible := False;
end;

procedure TfrmPrincipal.HighLightWords(const text: string; const matchResults: TArray<TMatchResult>);
var
  i, j, startPos, matchLength: Integer;
  foundWord: string;
begin
  mmRichEdit.Text := text;
  mmRichEdit.SelStart := 0;
  mmRichEdit.SelLength := 0;
  mmRichEdit.SelAttributes.Color := clWindowText;


  for i := 0 to Length(matchResults) - 1 do
  begin
    mmRichEdit.SelStart := matchResults[i].Position - 1;
    mmRichEdit.SelLength := Length(matchResults[i].Word);
    mmRichEdit.SelAttributes.BackColor := clYellow;
    mmRichEdit.Refresh;
  end;
end;

end.