program ArrayAndPointer;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Winapi.Windows;

var
  s: array[0..9] of AnsiChar;
  d: array of AnsiChar;
  p: Pointer;

begin
  try
    //Move,FillChar����,����Ĳ�����ʾ��Ҫ�����������ڴ���׵�ַ
    //���ھ�̬����s,ʹ����������s��s[0]��һ����,����ʾ�����׵�ַ
    //���ڶ�̬����,d��d[0]�ǲ�һ����,d[0]�ű�ʾ������׵�ַ
    //�ص�Ҫ��������ڴ浥Ԫ���׵�ַ
    //@s��@s[0]��һ����,��ʾָ���׵�ַ��ָ��
    //@d��@d[0]�ǲ�һ����,@d[0]��ʾָ���׵�ַ��ָ��,@d��ʾָ���������d�����ָ��
    FillChar(s, 10, 'a');
    FillChar(s[0], 10, 'b');
    p := @s;
    FillChar(p^, 10, 'd'); //ͬ��s
    p := @s[0];
    FillChar(p^, 10, 'c'); //ͬ��s[0]
    //FillChar(p, 10, 'd'); //����������p��ʼ�������ڴ�,����

    //��̬����d�൱��һ��ָ��
    //����d������Ԫ�طֱ𱣴����ڴ��еĲ�ͬ����
    SetLength(d, 10);
    FillChar(d[0], 10, 'a');
    //FillChar(d, 9, 'b');  //����������d��ʼ�������ڴ�,����
    p := @d[0];
    FillChar(p^, 10, 'c'); //��ͬ��d[0]
    //FillChar(p, 10, 'd'); //����������p��ʼ�������ڴ�,����
    p := @d;
    //FillChar(p^, 10, 'e'); //����������d��ʼ�������ڴ�,����

    //�������MoveMemory, CopyMemory, FillMemory, ZeroMemory�Ⱥ���
    //�ڲ�ʵ�ֵ�����Move, ��������������������ڴ���׵�ַ��
    //����ָ�������ڴ��ָ��
    //�������������ʹ��s,s[0],����a,a[0]
    //��̬����ʹ��@s��@s[0],������д����һ�µ�
    //��̬����ʹ��@d[0],����ʹ��@d
    //���ڶ�̬����d���ƻ��������ʱ,ʹ��@d����Ǵ����
    //��Ҫע��FillChar���Ĳ���ʱp^
    //FillMemory���Ĳ�����p
    FillMemory(@s, 10, 1);
    FillMemory(@s[0], 10, 2);
    p := @s;
    FillMemory(p, 10, 3);
    p := @s[0];
    FillMemory(p, 10, 4);

    //FillMemory(@d, 10, 1);//����,@d��һ��ָ��d��ָ��
    FillMemory(@d[0], 10, 2);
    p := @d[0];
    FillMemory(p, 10, 3);
    p := @d;
    FillMemory(p, 10, 4); //����

    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

