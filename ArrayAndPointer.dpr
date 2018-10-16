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
    //Move,FillChar函数,传入的参数表示需要操作的连续内存的首地址
    //对于静态数组s,使用数组名称s和s[0]是一样的,都表示数组首地址
    //对于动态数组,d和d[0]是不一样的,d[0]才表示数组的首地址
    //重点要理解连续内存单元的首地址
    //@s和@s[0]是一样的,表示指向首地址的指针
    //@d和@d[0]是不一样的,@d[0]表示指向首地址的指针,@d表示指向数组变量d本身的指针
    FillChar(s, 10, 'a');
    FillChar(s[0], 10, 'b');
    p := @s;
    FillChar(p^, 10, 'd'); //同于s
    p := @s[0];
    FillChar(p^, 10, 'c'); //同于s[0]
    //FillChar(p, 10, 'd'); //这样填充的是p开始的连续内存,错误

    //动态数组d相当于一个指针
    //变量d和数组元素分别保存在内存中的不同区域
    SetLength(d, 10);
    FillChar(d[0], 10, 'a');
    //FillChar(d, 9, 'b');  //这样填充的是d开始的连续内存,错误
    p := @d[0];
    FillChar(p^, 10, 'c'); //等同于d[0]
    //FillChar(p, 10, 'd'); //这样填充的是p开始的连续内存,错误
    p := @d;
    //FillChar(p^, 10, 'e'); //这样填充的是d开始的连续内存,错误

    //另外对于MoveMemory, CopyMemory, FillMemory, ZeroMemory等函数
    //内部实现调用了Move, 但是其参数不再是连续内存的首地址了
    //而是指向连续内存的指针
    //所以其参数不能使用s,s[0],或者a,a[0]
    //静态数组使用@s和@s[0],这两种写法是一致的
    //动态数组使用@d[0],不能使用@d
    //对于动态数组d复制或填充数据时,使用@d多半是错误的
    //还要注意FillChar传的参数时p^
    //FillMemory传的参数是p
    FillMemory(@s, 10, 1);
    FillMemory(@s[0], 10, 2);
    p := @s;
    FillMemory(p, 10, 3);
    p := @s[0];
    FillMemory(p, 10, 4);

    //FillMemory(@d, 10, 1);//错误,@d是一个指向d的指针
    FillMemory(@d[0], 10, 2);
    p := @d[0];
    FillMemory(p, 10, 3);
    p := @d;
    FillMemory(p, 10, 4); //错误

    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

