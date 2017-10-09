unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, MemDS, DBAccess, Uni,
  UniProvider, ODBCUniProvider, AccessUniProvider, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Baglanti: TUniConnection;
    Provider: TAccessUniProvider;
    Sorgu: TUniQuery;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
 with Sorgu do
 begin
   Close;  //Sorgu kapatýlýyor.
   SQL.Clear; //Ne olur ne olmaz SQL tahtamýz siliniyor.
   SQL.Text := 'select * from KullaniciGiris where (KAdi=:Kadi or KTelefon=:KTelefon) and KSifre=:KSifre'; //SQL sorgumuzu ekliyoruz.
   ParamByName('KAdi').Value := Edit1.Text;  //Parametlereler tanýmlanýyor..
   ParamByName('KTelefon').Value := Edit1.Text;  //Parametlereler tanýmlanýyor..
   ParamByName('KSifre').Value := Edit2.Text;   //Parametlereler tanýmlanýyor..
   Open;  //Sorgu açýlýyor.
 end;

  if Sorgu.RecordCount > 0 then    /// Kayýt sayýsý eðer 0'dan büyük ise kullanýcý var ve giriþ izni verilir.
  begin
    MessageBox(handle, 'Giriþ baþarýyla gerçekleþti, tebrikler!', 'Tebrikler!', MB_OK + MB_ICONINFORMATION);
  end
  else
  begin
    if Sorgu.RecordCount <= 0 then     /// Kayýt sayýsý 0 veya 0'dan küçük bir sayý ise kullanýcý yok ve izin verilmez.
    begin
      MessageBox(handle, 'Kullanici Adi veya Þifre Yanlýþ!', 'Bi Yanlýþlýk Var!', MB_OK + MB_ICONWARNING);
    end;
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 try
   with Baglanti do
  begin
   ProviderName := 'Access';  //Veritabaný türünü belirler.
   Database := 'Data.mdb'; //Uygulamanýn bulunduðu yolu iþaret eder.
   // Password := **** --> Þifre olduðunda bu parametre kullanýr.
   Connected := True; //Baðlantýyý açtýran komut.


      with Sorgu do
      begin
        Connection := Baglanti; //Baglanti connection bileþenimizi query bileþenine tanýtýyoruz.
      end;

  MessageBox(handle, 'Veritabaný ile baðlantý baþarýyla saðlandý!', 'Baþarýlý!', MB_OK + MB_ICONINFORMATION);

  end;
 except
   MessageBox(handle, 'Veritabaný baðlantý hatasý!', 'Hata!', MB_OK + MB_ICONERROR);
   Application.Terminate;  ///Program kapatma komutu.
 end;
end;

end.
