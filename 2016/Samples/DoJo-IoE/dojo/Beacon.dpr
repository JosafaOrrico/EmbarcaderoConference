program Beacon;

uses
  System.StartUpCopy,
  FMX.Forms,
  ExBeacon in 'ExBeacon.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
