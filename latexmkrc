$pdf_previewer = 'open -a Skim';                                                                                      
@generated_exts = (@generated_exts, 'xsim', 'synctex.gz');
$pdflatex = 'pdflatex --shell-escape %O %S -synctex=0 -interaction=nonstopmode';
$xelatex = 'xelatex %O %S -synctex=0 -interaction=nonstopmode';
$lualatex = 'lualatex %O %S -synctex=0 -interaction=nonstopmode';
$aux_dir='/Users/preynol1/.cache/latexmk_aux_dir/';

#2025-07-08 The pdf_mode variable specifies the TeX engine, however these lines are unnecessary if I'm using vimtex, which respects declarations like %! TeX program = pdflatex
#$pdf_mode = 1; #uses pdflatex
#$pdf_mode = 4; #uses lualatex
#$pdf_mode = 5; #uses xelatex
