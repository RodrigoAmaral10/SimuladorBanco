unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, SkinAlterdata, dxSkinsDefaultPainters,
  dxSkinsdxBarPainter, ImgList, cxGraphics, dxBar, cxClasses,
  cxLookAndFeels, dxSkinsForm, Conta, ContaVIP, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxSkinController1: TdxSkinController;
    edtDepositar: TEdit;
    edtSacar: TEdit;
    rgpTipoConta: TRadioGroup;
    edtIdade: TEdit;
    lblIdade: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure dxBarLargeButton5Click(Sender: TObject);
  private
    FContaBancaria: TConta;
    Nome: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.dxBarLargeButton1Click(Sender: TObject);
begin
  if rgpTipoConta.ItemIndex = 0 then
    begin
      if (edtIdade.Text <> '') and (StrToInt(edtIdade.Text) < 18) then
        FContaBancaria := TConta.Create(StrToInt(edtIdade.Text))
      else
        FContaBancaria := TConta.Create()
    end
  else
    if rgpTipoConta.ItemIndex = 1 then
    FContaBancaria := TContaVIP.Create();

  FContaBancaria.NomeTitular := 'Rodrigo Amaral';
  FContaBancaria.NumeroConta := '123456-7';
  FContaBancaria.Idade := 23;

  ShowMessage(Format('Você abriu sua conta com sucesso, %s.', [FContaBancaria.NomeTitular]));
end;

procedure TForm1.dxBarLargeButton2Click(Sender: TObject);
begin
  ShowMessage(Format('Você tem %s reais na sua conta.', [FloatToStr(FContaBancaria.Saldo)]));
end;

procedure TForm1.dxBarLargeButton3Click(Sender: TObject);
begin
  if FContaBancaria.Depositar(StrToFloat(edtDepositar.Text)) then
    edtDepositar.Text := '';
end;

procedure TForm1.dxBarLargeButton5Click(Sender: TObject);
begin
  if FContaBancaria.Sacar(StrToFloat(edtSacar.Text)) then
    edtSacar.Text := '';
end;

end.
