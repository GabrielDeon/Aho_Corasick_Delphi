unit uAhoCorasick;

interface

uses
  System.Classes, System.SysUtils, System.Generics.Collections;

type
  TNode = class
  public
    Next: array[Char] of TNode;
    Fail: TNode;
    IsWord: Boolean;
    Word: string;
    constructor Create;
    function GetNext(ch: Char): TNode;
  end;

  TMatchResult = record
    Word: string;
    Position: Integer;
  end;

  TAhoCorasick = class
  private
    FRoot: TNode;
    procedure BuildFailLinks;
    function FindNextState(state: TNode; ch: Char): TNode;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Build;
    procedure AddWord(const word: string);
    function FindWords(const text: string): TArray<TMatchResult>;
  end;

implementation

{ TNode }

constructor TNode.Create;
begin
  inherited Create;
  FillChar(Next, SizeOf(Next), 0);
  Fail := nil;
  IsWord := False;
  Word := '';
end;

function TNode.GetNext(ch: Char): TNode;
begin
  Result := Next[ch];
end;

{ TAhoCorasick }

constructor TAhoCorasick.Create;
begin
  inherited Create;
  FRoot := TNode.Create;
end;

destructor TAhoCorasick.Destroy;
begin
  FRoot.Free;
  inherited Destroy;
end;

procedure TAhoCorasick.AddWord(const word: string);
var
  currentNode: TNode;
  i: Integer;
begin
  currentNode := FRoot;
  for i := 1 to Length(word) do
  begin
    if currentNode.GetNext(word[i]) = nil then
      currentNode.Next[word[i]] := TNode.Create;
    currentNode := currentNode.GetNext(word[i]);
  end;
  currentNode.IsWord := True;
  currentNode.Word := word;
end;

procedure TAhoCorasick.BuildFailLinks;
var
  queue: TQueue<TNode>;
  currentNode, r, s: TNode;
  ch: Char;
begin
  queue := TQueue<TNode>.Create;
  try
    // Inicializa a fila com os filhos diretos do nó raiz
    for ch := Low(Char) to High(Char) do
    begin
      if FRoot.GetNext(ch) <> nil then
      begin
        FRoot.GetNext(ch).Fail := FRoot;
        queue.Enqueue(FRoot.GetNext(ch));
      end;
    end;

    // Processa os nós na fila e atribui os nós de falha
    while queue.Count > 0 do
    begin
      r := queue.Dequeue;
      for ch := Low(Char) to High(Char) do
      begin
        if r.GetNext(ch) <> nil then
        begin
          s := r.GetNext(ch);
          queue.Enqueue(s);
          currentNode := r.Fail;
          while (currentNode <> nil) and (currentNode.GetNext(ch) = nil) do
            currentNode := currentNode.Fail;
          if currentNode = nil then
            s.Fail := FRoot
          else
            s.Fail := currentNode.GetNext(ch);
        end;
      end;
    end;
  finally
    queue.Free;
  end;
end;

function TAhoCorasick.FindNextState(state: TNode; ch: Char): TNode;
var
  nextState: TNode;
begin
  while (state <> nil) and (state.GetNext(ch) = nil) do
    state := state.Fail;
  if state = nil then
    nextState := FRoot
  else
    nextState := state.GetNext(ch);
  Result := nextState;
end;

procedure TAhoCorasick.Build;
begin
  BuildFailLinks;
end;

function TAhoCorasick.FindWords(const text: string): TArray<TMatchResult>;
var
  currentNode, r, s: TNode;
  matches: TArray<TMatchResult>;
  matchCount: Integer;
  i: Integer;
begin
  currentNode := FRoot;
  matchCount := 0;
  SetLength(matches, 0);
  for i := 1 to Length(text) do
  begin
    currentNode := FindNextState(currentNode, text[i]);
    r := currentNode;
    s := r;
    while s <> FRoot do
    begin
      if s.IsWord then
      begin
        Inc(matchCount);
        SetLength(matches, matchCount);
        matches[matchCount - 1].Word := s.Word;
        matches[matchCount - 1].Position := i - Length(s.Word) + 1;
      end;
      s := s.Fail;
    end;
  end;
  Result := matches;
end;

end.

