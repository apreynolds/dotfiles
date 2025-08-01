map <leader>vs :Start! open %:r-solutions.pdf <CR>
map <leader>vm :Start! open %:r-marker.pdf <CR>
map <leader>vi :Start! open %:r-instructor.pdf <CR>
map <leader>vc :Start! open %:r-coverpage.pdf <CR>
map <leader>vp :Start! open %:r-pf.pdf <CR>
map <leader>vh :Start! open %:r.html<CR>

map <F10> :VimtexCompile
map <F12> :Compile
map <leader>LL :CompileLectures
map <leader>LI :CompileInstructor<CR>
map <leader>LA :CompileAllSolutions<CR>
map <leader>LB :CompileBothMarkerSolutions<CR>
map <leader>LC :CompileCoverMarkerSolutions<CR>
map <leader>LF :CompileCover<CR>
map <leader>LX :CompileXelatex<CR>
map <leader>LE :CompileEscape<CR>

command! -nargs=0 GenerateBasic
      \ Start! latexmk -pdf -pdflatex="pdflatex --shell-escape \%O \%S" %  
      \ && latexmk -c % && 

command! -nargs=0 GenerateInstructor
      \ Start! latexmk -silent -pdf -jobname=%:r-instructor -pdflatex="pdflatex --shell-escape \%O '\def\MyComments{1} \def\Solutions{1} \input{\%S}'" %:r 
      \ && latexmk -c -jobname=%:r-instructor %:r 

command! -nargs=0 GenerateSolutions
      \ Start! latexmk -pdf -jobname=%:r-solutions -pdflatex="pdflatex --shell-escape \%O '\def\Solutions{1} \input{\%S}'" % 
      \ && latexmk -c -jobname=%:r-solutions % 

command! -nargs=0 GenerateMarker
      \ Start! latexmk -pdf -jobname=%:r-marker -pdflatex="pdflatex --shell-escape \%O '\def\Solutions{1} \def\MyComments{1} \input{\%S}'" % 
      \ && latexmk -c -jobname=%:r-marker % 

command! -nargs=0 GenerateCover
      \ Start! latexmk -pdf -jobname=%:r-coverpage -pdflatex="pdflatex --shell-escape \%O '\def\FirstPageOnly{1} \input{\%S}'" % 
      \ && latexmk -c -jobname=%:r-coverpage %

command! -nargs=0 CompileXelatex write | Start! latexmk -xelatex %  && latexmk -c % 

command! -nargs=0 CompileEscape write | Start! latexmk -pdf -pdflatex="pdflatex --shell-escape \%O \%S" % && latexmk -c % 

command! -nargs=0 CompileLectures call CompileLecturesFn()

command! -nargs=1 MoveLectures call MoveLecturesFn( <q-args> )

function! CompileLecturesFn()
  let l:cwd = getcwd()
  lcd %:h

  execute 'write'
  execute 'GenerateBasic'
  execute 'GenerateInstructor'
      
  execute "lcd " . l:cwd

endfunction

function! MoveLecturesFn(number)
  let l:cwd = getcwd()
  lcd %:h

  let l:outputdir="/Users/preynol1/PDFExpert/Documents/"
  let l:pdfbasic = expand( '%:r' ) . ".pdf"
  let l:pdfinstructor = expand( '%:r' ) . "-instructor.pdf"

  if filereadable(l:pdfbasic)
    let tempcommand = 'rsync ' . l:pdfbasic . ' ' . l:outputdir . a:number . '/'
    call system(tempcommand)
  endif

  if filereadable(l:pdfinstructor)
    let tempcommandtwo = 'rsync ' . l:pdfinstructor . ' ' . l:outputdir . a:number . '/'
    call system(tempcommandtwo)
  endif

  execute "lcd " . l:cwd

endfunction

command! -nargs=0 CompileInstructor call CompileInstructorFn()

function! CompileInstructorFn()
  let l:cwd = getcwd()
  lcd %:h

  execute 'write'
  execute 'GenerateBasic'
  execute 'GenerateInstructor'
  execute "lcd " . l:cwd

endfunction

command! -nargs=0 CompileAllSolutions call CompileAllSolutionsFn()

function! CompileAllSolutionsFn()
  let l:cwd = getcwd()
  lcd %:h

  execute 'write'
  execute 'GenerateBasic'
  execute 'GenerateSolutions'
  execute "lcd " . l:cwd

endfunction

command! -nargs=0 CompileBothMarkerSolutions call CompileBothMarkerSolutionsFn()

function! CompileBothMarkerSolutionsFn()
  let l:cwd = getcwd()
  lcd %:h

  execute 'write'
  execute 'GenerateBasic'
  execute 'GenerateSolutions'
  execute 'GenerateMarker'
  execute "lcd " . l:cwd

endfunction

command! -nargs=0 CompileCoverMarkerSolutions call CompileCoverMarkerSolutionsFn()

function! CompileCoverMarkerSolutionsFn()
  let l:cwd = getcwd()
  lcd %:h

  execute 'write'
  execute 'GenerateBasic'
  execute 'GenerateSolutions'
  execute 'GenerateMarker'
  execute 'GenerateCover'
  execute "lcd " . l:cwd

endfunction

command! -nargs=0 CompileCover call CompileCoverFn()

function! CompileCoverFn()
  let l:cwd = getcwd()
  lcd %:h

  execute 'write'
  execute 'GenerateCover'
  execute "lcd " . l:cwd

endfunction

command! -nargs=0 CompileTEMP write | 
      \ Start! latexmk -pdf -pdflatex="pdflatex \%O \%S" %  
      \ && latexmk -c % && 
      \ latexmk -pdf -jobname=%:r-teacher -pdflatex="pdflatex --shell-escape \%O '\def\TeacherCopyToggle{1} \input{\%S}'" % 
      \ && latexmk -c -jobname=%:r-teacher % 

"command! -nargs=0 CompileSolutions write | 
      "\ Start! latexmk -pdf -pdflatex="pdflatex \%O \%S" %  
      "\ && latexmk -c % && 
      "\ latexmk -pdf -jobname=%:r-solutions -pdflatex="pdflatex --shell-escape \%O '\def\Solutions{1} \input{\%S}'" % 
      "\ && latexmk -c -jobname=%:r-solutions % 

"command! -nargs=0 CompileMarkerSolutions write | 
      "\ Start! latexmk -pdf -pdflatex="pdflatex \%O \%S" %  
      "\ && latexmk -c % && 
      "\ latexmk -pdf -jobname=%:r-solutions -pdflatex="pdflatex --shell-escape \%O '\def\Solutions{1} \input{\%S}'" % 
      "\ && latexmk -c -jobname=%:r-solutions % 
      "\ && latexmk -pdf -jobname=%:r-marker -pdflatex="pdflatex --shell-escape \%O '\def\Solutions{1} \def\MyComments{1} \input{\%S}'" % 
      "\ && latexmk -c -jobname=%:r-marker % 

"command! -nargs=0 CompileCoverMarkerSolutions write | 
      "\ Start! latexmk -pdf -pdflatex="pdflatex \%O \%S" %  
      "\ && latexmk -c % && 
      "\ latexmk -pdf -jobname=%:r-solutions -pdflatex="pdflatex --shell-escape \%O '\def\Solutions{1} \input{\%S}'" % 
      "\ && latexmk -c -jobname=%:r-solutions % 
      "\ && latexmk -pdf -jobname=%:r-marker -pdflatex="pdflatex --shell-escape \%O '\def\Solutions{1} \def\MyComments{1} \input{\%S}'" % 
      "\ && latexmk -c -jobname=%:r-marker % 
      "\ && latexmk -pdf -jobname=%:r-coverpage -pdflatex="pdflatex --shell-escape \%O '\def\FirstPageOnly{1} \input{\%S}'" % 
      "\ && latexmk -c -jobname=%:r-coverpage %


"command! -nargs=0 CompileLectures write | 
      "\ Start! latexmk -silent -pdf -jobname=%:r-instructor -pdflatex="pdflatex --shell-escape \%O '\def\MyComments{1} \input{\%S}'" %:r 
      "\ && latexmk -c -jobname=%:r-instructor %:r 
      "\ && latexmk -silent -pdf -pdflatex="pdflatex \%O \%S" %:r  
      "\ && latexmk -silent -jobname=2203-%:r -outdir=/Users/preynol1/PDFExpert/Documents/course_docs -pdf -pdflatex="pdflatex \%O \%S" %:r  
      "\ && latexmk -c %:r 

"command! -nargs=0 CompileprinterFriendly write | Start! latexmk -pdf -jobname=%:r-pf -pdflatex="pdflatex --shell-escape \%O '\def\PrinterFriendly{1} \input{\%S}'" % && latexmk -c -jobname=%:r_PF % 

