TikZ_content <- function(arg,obj_name,xshift,yshift,rotate) {
  if (arg == "Shark 1st Move") {
    TikZ_code <- sprintf("
                         \\draw pic[xshift=%.2fin,yshift=%.2fin,scale=0.15,rotate around={%.2f:(2,-1)}] {%s};
                        ",xshift,yshift,rotate,obj_name
    )
  }
  if (arg == "Shark 2nd Move") {
    TikZ_code <- sprintf("
                         \\draw pic[xshift=%.2fin,yshift=%.2fin,scale=0.15,rotate around={%.2f:(2,-1)}] {%s};
                        ",xshift,yshift,rotate,obj_name
    )
  }
  if (arg == "Shark 3rd Move") {
    TikZ_code <- sprintf("
                         \\draw pic[xshift=%.2fin,yshift=%.2fin,scale=0.15,rotate around={%.2f:(2,-1)}] {%s};
                        ",xshift,yshift,rotate,obj_name
    )
  }
  if (arg == "Shark 4th Move") {
    TikZ_code <- sprintf("
                         \\draw pic[xshift=%.2fin,yshift=%.2fin,scale=0.15,rotate around={%.2f:(2,-1)}] {%s};
                        ",xshift,yshift,rotate,obj_name
    )
  }
  if (arg == "Shark 5th Move") {
    TikZ_code <- sprintf("
                         \\draw pic[xshift=%.2fin,yshift=%.2fin,scale=0.15,rotate around={%.2f:(2,-1)}] {%s};
                        ",xshift,yshift,rotate,obj_name
    )
  }
  
  ##################################################################################################
  ##################################################################################################
  ########################  TikZ code for all episodes frames ends here  ###########################
  ##################################################################################################
  ##################################################################################################
  
    return(TikZ_code)
}

##################################################################################################
##################################################################################################
# Main TikZ codes function finished ... here starts the sub-function for repeated TikZ code call #
##################################################################################################
##################################################################################################
