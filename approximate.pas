uses graphABC;

function F(k, b, x: real):real;
begin
  F:=k * x + b;
end;

var i, ed:integer; sx, sy, sxx, sxy, d, dk, db, k, b: real; s:string;
const n: integer=6; x: array[1..6] of integer=(1,2,3,4,5,6); y: array[1..6] of integer=(2, -9, 5, -99, 6, -30);
begin
  sx:=0;sy:=0;sxx:=0;sxy:=0;
  for i:=1 to n do begin
    sx:= sx + x[i];
    sy:= sy + y[i];
    sxx:= sxx + x[i] * x[i];
    sxy := sxy + x[i] * y[i];
  end;
  d:= n * sxx - sx * sx;
  dk := n * sxy - sy * sx;
  db:=sxx * sy - sx * sxy;
  k:= dk / d;
  b := db / d;
  write('y = ', k:0:2, 'x + ', b:0:2);
  ed := 40; 
  line(0, 240, 640, 240); 
  line(320, 0, 320, 480); 
  line(320, 0, 317, 3); 
  line(320, 0, 323, 3); 
  line(640, 240, 637, 243); 
  line(640, 240, 637, 237); 
  SetFontSize(12); 
  SetFontColor(clBlue); 
  TextOut(625, 210, 'X'); 
  TextOut(330, 0, 'Y'); 
  SetFontSize(8); 
  SetFontColor(clRed); 
  for i := 1 to (320 div ed) - 1 do 
  begin 
  str(i, s); 
  line(320 + ed * i, 238, 320 + ed * i, 242); 
  line(320 - ed * i, 238, 320 - ed * i, 242); 
  TextOut(320 + ed * i, 245, s); 
  TextOut(310 - ed * i, 245, '-' + s); 
  end; 
  for i := 1 to (240 div ed) - 1 do 
  begin 
  str(i, s); 
  line(318, 240 + ed * i, 322, 240 + ed * i); 
  line(318, 240 - ed * i, 322, 240 - ed * i); 
  TextOut(325, 233 + ed * i, '-' + s); 
  TextOut(325, 233 - ed * i, s); 
  end; 
  TextOut(325, 225, '0');
  moveto(0, trunc(240 - ed * F(k, b,(0 - 320) / ed)));
  for i := 1 to 640 do
  begin
    //if (trunc(240 - ed * F(k, b,(i - 320) / ed)) >= 0) and (trunc(240 - ed * F(k, b,(i - 320) / ed)) <= 480) then
      lineto(i, trunc(240 - ed * F(k, b,(i - 320) / ed)))
    //else begin moveto(i, trunc(240 - ed * F(k,b,(i - 320) / ed)));end;
  end;
  for i:=1 to n do begin
    SetPixel(320 + x[i] * ed, 240 + y[i] * ed, clRed);
    SetPixel(320 + x[i] * ed + 1, 240 + y[i] * ed, clRed);
    SetPixel(320 + x[i] * ed - 1, 240 + y[i] * ed, clRed);
    SetPixel(320 + x[i] * ed, 240 + y[i] * ed + 1, clRed);
    SetPixel(320 + x[i] * ed, 240 + y[i] * ed - 1, clRed);
  end;
end.