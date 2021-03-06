unit ContaVIP;

interface

uses
  Conta;

type
  TContaVIP = class(TConta)
  protected
    function TaxaPercentual(): Double;
    function GetSaldo: Double; override;

  public
    constructor Create();

    property Saldo: Double read GetSaldo;
  end;

implementation

{ TContaVIP }

constructor TContaVIP.Create;
begin
  FSaldo := 50;
end;

function TContaVIP.TaxaPercentual(): Double;
begin
  Result := 0.99;
end;

function TContaVIP.GetSaldo: Double;
begin
  FSaldo := FSaldo * TaxaPercentual();

  Result := FSaldo;
end;

end.
