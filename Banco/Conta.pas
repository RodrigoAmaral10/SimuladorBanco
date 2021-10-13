unit Conta;

interface

uses
  Dialogs, SysUtils;

type
  TConta = class
  private
    function GetIdade: Integer;
    procedure SetIdade(const Value: Integer);
  protected
    FSaldo: Double;
    FNomeTitular: String;
    FNumeroConta: String;
    FIdade: Integer;

    function GetSaldo(): Double; virtual;
    function GetNomeTitular: String;
    function GetNumeroConta: String;
    procedure SetNomeTitular(const Value: String);
    procedure SetNumeroConta(const Value: String);
    function TaxaPercentual: Double;
  public
    function Sacar(pValor: Double): Boolean;
    function Depositar(pValorDeDeposito: Double): Boolean;
    constructor Create(); overload;
    constructor Create(pIdade: Integer); overload;

    property Saldo: Double read GetSaldo;
    property NomeTitular: String read GetNomeTitular write SetNomeTitular;
    property NumeroConta: String read GetNumeroConta write SetNumeroConta;
    property Idade: Integer read GetIdade write SetIdade;
  end;

implementation

{ TConta }

constructor TConta.Create();
begin
  FSaldo := 0;
end;

constructor TConta.Create(pIdade: Integer);
begin
  FSaldo := 20;
end;

function TConta.Depositar(pValorDeDeposito: Double): Boolean;
begin
  Result := not (pValorDeDeposito >= 1000);

  if Result then
    FSaldo := FSaldo + pValorDeDeposito
  else
    ShowMessage('Não é possível depositar mais do que 1000 Reais.')
end;

function TConta.GetSaldo: Double;
begin
  FSaldo := FSaldo * TaxaPercentual();
  
  Result := FSaldo;
end;

function TConta.Sacar(pValor: Double): Boolean;
begin
  Result := not (pValor > FSaldo);

  if Result then
    begin
      FSaldo := FSaldo - pValor;
      ShowMessage(Format('R$ %s, sacado com sucesso!', [FloatToStr(pValor)]))  
    end
  else
    ShowMessage(Format('Não é possível sacar mais do que o disponível na sua conta, que é: R$ %s.', [FloatToStr(FSaldo)]))
end;

function TConta.GetNomeTitular: String;
begin
  Result := FNomeTitular;
end;

function TConta.GetNumeroConta: String;
begin
  Result := FNumeroConta;
end;

procedure TConta.SetNomeTitular(const Value: String);
begin
  FNomeTitular := Value;
end;

procedure TConta.SetNumeroConta(const Value: String);
begin
  FNumeroConta := Value;
end;

function TConta.TaxaPercentual(): Double;
begin
  Result := 0.85;
end;

function TConta.GetIdade: Integer;
begin
  Result := FIdade;
end;

procedure TConta.SetIdade(const Value: Integer);
begin
  FIdade := Value;
end;

end.
