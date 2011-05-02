<?php
$index="index.php";
$filename = basename($_GET['file']);
$enlace="descargas/".$filename;
// addition by Jorg Weske
$file_extension = strtolower(substr(strrchr($filename,"."),1));
#Con substr saco el . que me devuelve la funcion strrchr, ya que devuelve la extension ejemplo .php quedando php

#------------Bloque Seguridad ------------------
if( $filename == "" ) {
	header("Location:".$index);
   
}
elseif( ! file_exists( $enlace )) {
	header("Location:".$index);exit;
}

elseif ($file_extension=="") 	{
	header("Location:".$index);
}


#-----------Fin Bloque Seguridad--------------

if(preg_match('/pdf|txt|zip|rar|xls|doc|ppt|pps|odt|gif|png|jpeg|jpg/i',$file_extension)){
echo '<script>alert("Se encontro coincidencia '.$file_extension.'")</script>';

switch($file_extension )
{
  case "pdf": $ctype="application/pdf"; break;
  case "zip": $ctype="application/zip"; break;
  case "doc": $ctype="application/msword"; break;
  case "xls": $ctype="application/vnd.ms-excel"; break;
  case "ppt": $ctype="application/vnd.ms-powerpoint"; break;
  case "gif": $ctype="image/gif"; break;
  case "png": $ctype="image/png"; break;
  case "jpeg":
  case "jpg": $ctype="image/jpg"; break;
  default: $ctype="application/force-download";
}

header("Pragma: public"); // required
header("Expires: 0");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
header("Cache-Control: private",false); // required for certain browsers 
header("Content-Type: $ctype");
header("Content-Disposition: attachment; filename=\"".$filename."\";" );#nombre del archivo en la descarga
header("Content-Transfer-Encoding: binary");
header("Content-Length: ".filesize($enlace));
readfile("$enlace");

}

?>

