unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Imaging.jpeg, Vcl.WinXPanels, Vcl.Mask, uAhoCorasick, Vcl.OleCtrls,
  SHDocVw, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, System.JSON,
  REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, IdSSLOpenSSL, IdHTTP, IdURI;

type
  TLinguagem = (liNenhum, liInglês, liChinês, liFrancês, liAlemão, liItaliano, liPortuguês, liRusso);
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
    mmRichEdit: TRichEdit;
    btnClear: TButton;
    Label7: TLabel;
    cbxtraducao1: TComboBox;
    cbxtraducao2: TComboBox;
    Label8: TLabel;
    pnLog: TPanel;
    Panel2: TPanel;
    Label11: TLabel;
    mmLog: TRichEdit;
    ckbDestacar: TCheckBox;
    ckbCaseSensititve: TCheckBox;
    edtTraducao1: TEdit;
    edtTraducao2: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtPalavra3: TEdit;
    cbxTraducao3: TComboBox;
    edtTraducao3: TEdit;
    procedure btnProcurarClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cbxtraducao1Change(Sender: TObject);
    procedure cbxtraducao2Change(Sender: TObject);
    procedure cbxTraducao3Change(Sender: TObject);
    procedure edtPalavra1Change(Sender: TObject);
    procedure edtPalavra2Change(Sender: TObject);
    procedure edtPalavra3Change(Sender: TObject);

  private
    { Private declarations }
    procedure HighLightWords(const text: string; const matchResults: TArray<TMatchResult>);
    procedure FindAndHighlightWord(RichEdit: TRichEdit; const SearchWord: string);
    function TranslateText(pPalavra: string; pTargetLanguage: string):string;
    function GetTranslatedTextFromResponse(const Response: string): string;
    procedure ControlaCbxTraducoes(pCBX: TComboBox; pEdit: TEdit; pPalavra: TEdit);
    procedure ControlaEditPalavra(pEditTraducao: TEdit; pCbxTraducao: TComboBox);
    function GetSiglaLinguagem(pLinguagem: string): string;
    procedure AdicionarPalavraPesquisa(pEdit: TEdit; pAhoCorasick: TAhoCorasick);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.AdicionarPalavraPesquisa(pEdit: TEdit; pAhoCorasick: TAhoCorasick);
begin
  if pEdit.Text <> EmptyStr then
  begin
    if ckbCaseSensititve.Checked then
    begin
      pAhoCorasick.AddWord(LowerCase(pEdit.Text));
    end else
    begin
      pAhoCorasick.AddWord(pEdit.Text);
    end;
  end;
end;

//Limpa os memo e deixa o log invisível
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
    ShowMessage('É necessário um texto base para poder prosseguir!')
  end else
  begin
    AhoCorasick := TAhoCorasick.Create;

    mmRichEdit.SelectAll;
    mmRichEdit.SelAttributes := mmRichEdit.DefAttributes;

    try
      // Adiciona as palavras chaves
      AdicionarPalavraPesquisa(edtPalavra1, AhoCorasick);
      AdicionarPalavraPesquisa(edtPalavra2, AhoCorasick);
      AdicionarPalavraPesquisa(edtPalavra3, AhoCorasick);

      //Adiciona as Traduções
      AdicionarPalavraPesquisa(edtTraducao1, AhoCorasick);
      AdicionarPalavraPesquisa(edtTraducao2, AhoCorasick);
      AdicionarPalavraPesquisa(edtTraducao3, AhoCorasick);

      //Constroi a estrutura de busca
      AhoCorasick.Build;

      //Realize a busca no texto
      if ckbCaseSensititve.Checked then
      begin
        Matches := AhoCorasick.FindWords(mmRichEdit.Text);
      end else
      begin
        Matches := AhoCorasick.FindWords(LowerCase(mmRichEdit.Text));
      end;

      //Exibe as palavras encontradas no log
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

          mmLog.Lines.Add(Format('--Palavra encontrada: "%s" (Posição: %d)', [Matches[i].Word, Matches[i].Position]));
        end;
      end else
      begin
        ShowMessage('Nenhuma ocorrência encontrada!');
      end;
    finally
      //Libera os objetos da memória
      AhoCorasick.Free;
      mmLog.Refresh;
    end;
  end;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
//  TranslateText;
end;

procedure TfrmPrincipal.cbxtraducao1Change(Sender: TObject);
begin
  ControlaCbxTraducoes(cbxtraducao1, edtTraducao1, edtPalavra1);
end;

procedure TfrmPrincipal.cbxtraducao2Change(Sender: TObject);
begin
  ControlaCbxTraducoes(cbxtraducao2, edtTraducao2, edtPalavra2);
end;

procedure TfrmPrincipal.cbxTraducao3Change(Sender: TObject);
begin
  ControlaCbxTraducoes(cbxTraducao3, edtTraducao3, edtPalavra3);
end;

procedure TfrmPrincipal.FindAndHighlightWord(RichEdit: TRichEdit;
  const SearchWord: string);
var
  StartPos, FoundPos: Integer;
begin
  // Inicia a busca a partir do início do texto
  StartPos := 0;

  // Percorre o texto do RichEdit em busca da palavra
  repeat
    if(ckbCaseSensititve.Checked) then
    begin
      FoundPos := RichEdit.FindText(SearchWord, StartPos, Length(RichEdit.Text), [stMatchCase]);
    end else
    begin
      FoundPos := RichEdit.FindText(SearchWord, StartPos, Length(RichEdit.Text), []);
    end;

    // Se a palavra for encontrada, altera a cor de fundo
    if FoundPos >= 0 then
    begin
      RichEdit.SelStart := FoundPos;
      RichEdit.SelLength := Length(SearchWord);
      RichEdit.SelAttributes.BackColor := clYellow;
      RichEdit.Refresh;

      // Move a posição inicial para continuar a busca
      StartPos := FoundPos + Length(SearchWord);
    end;
  until FoundPos < 0;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  pnLog.Visible := False;
  edtTraducao1.Enabled := False;
  edtTraducao2.Enabled := False;
  edtTraducao3.Enabled := False;
end;

//Com base na linguágem retorna a sigla a ser usada na API
function TfrmPrincipal.GetSiglaLinguagem(pLinguagem: string): string;
begin
  if pLinguagem = 'Inglês' then
  begin
    result := 'en';
  end else
  if pLinguagem = 'Chinês' then
  begin
    result := 'zh';
  end else
  if pLinguagem = 'Francês' then
  begin
    result := 'fr';
  end else
  if pLinguagem = 'Alemão' then
  begin
    result := 'de';
  end else
  if pLinguagem = 'Italiano' then
  begin
    result := 'it';
  end else
  if pLinguagem = 'Português' then
  begin
    result := 'pt';
  end else
  if pLinguagem = 'Russo' then
  begin
    result := 'ru';
  end;
end;

function TfrmPrincipal.GetTranslatedTextFromResponse(const Response: string): string;
var
  JSONValue: TJSONValue;
begin
  JSONValue := TJSONObject.ParseJSONValue(Response);

  try
    if (JSONValue is TJSONObject) and (TJSONObject(JSONValue).GetValue('translatedText') <> nil) then
      Result := TJSONObject(JSONValue).GetValue('translatedText').Value
    else
      Result := '';
  finally
    JSONValue.Free;
  end;
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

//Controla o combobox das traduções
procedure TfrmPrincipal.ControlaCbxTraducoes(pCBX: TComboBox; pEdit: TEdit; pPalavra: TEdit);
begin
  if pCBX.Text = 'Nenhum' then
  begin
    pEdit.Clear;
    pEdit.Enabled := False
  end else
  begin
    if(pPalavra.Text = EmptyStr) then
    begin
      ShowMessage('Você deve digitar uma palavra antes de começar a tradução!');
      pCBX.ItemIndex := 0;
    end else
    begin
     pEdit.Enabled := True;
     pEdit.Text := LowerCase(TranslateText(pPalavra.Text, pCBX.Text));
    end;
  end;
end;

//Controla o edit da palavra chave
procedure TfrmPrincipal.ControlaEditPalavra(pEditTraducao: TEdit; pCbxTraducao: TComboBox);
begin
  if pCbxTraducao.ItemIndex <> 0 then
  begin
    pCbxTraducao.ItemIndex := 0;
  end;
  if pEditTraducao.Text <> EmptyStr then
  begin
    pEditTraducao.Clear;
  end;
end;

procedure TfrmPrincipal.edtPalavra1Change(Sender: TObject);
begin
  ControlaEditPalavra(edtTraducao1, cbxtraducao1);
end;

procedure TfrmPrincipal.edtPalavra2Change(Sender: TObject);
begin
  ControlaEditPalavra(edtTraducao2, cbxtraducao2);
end;

procedure TfrmPrincipal.edtPalavra3Change(Sender: TObject);
begin
  ControlaEditPalavra(edtTraducao3, cbxtraducao3);
end;

function TfrmPrincipal.TranslateText(pPalavra: string; pTargetLanguage: string): string;
var
  HttpClient: TIdHTTP;
  IdSSL: TIdSSLIOHandlerSocketOpenSSL;
  RequestBody: TStringStream;
  Response: string;
  sSigleLinguagem: string;
begin
  HttpClient := TIdHTTP.Create;
  RequestBody := TStringStream.Create;
  IdSSL := TIdSSLIOHandlerSocketOpenSSL.Create(HttpClient);

  sSigleLinguagem := GetSiglaLinguagem(pTargetLanguage);

  try
    IdSSL.SSLOptions.Method := sslvTLSv1_2; // Define a versão do protocolo TLS a ser usada
    HttpClient.IOHandler    := IdSSL; // Atribui o sslIOHandler ao HttpClient
    RequestBody.WriteString('{"q": "'+ pPalavra +'", "source": "auto", "target": "'+ sSigleLinguagem +'"}');
    HttpClient.Request.ContentType := 'application/json';

    try
      Response := HttpClient.Post('https://translate.argosopentech.com/translate', RequestBody);
      result   := GetTranslatedTextFromResponse(Response);
    except
      on E: Exception do
      begin
        ShowMessage('Não foi possível encontrar uma tradução. Erro:' + E.Message);
      end;
    end;

  finally
    HttpClient.Free;
    RequestBody.Free;
    IdSSL.Free; // Libera a instância do sslIOHandler
  end;
end;

end.
