unit UNTConn;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMySQL, Data.DB, Data.SqlExpr;

type
  TDMConn = class(TDataModule)
    DBAYT: TSQLConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMConn: TDMConn;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
