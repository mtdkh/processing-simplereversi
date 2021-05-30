//player=1=WhiteStone : player=-1=BlackStone//

int BOADSIZE = 520;
int STONESIZE = 50;
int COLUMN = 8;
int ROW = 8;
int MASSSIZE = BOADSIZE/COLUMN;
int[][] stone = new int[COLUMN][ROW];
int player = 1;
int white_num = 2;
int black_num = 2;

void setup() {
  textAlign(CENTER);
  
  size(720, 520);
  for (int i=0; i<COLUMN; i++) {
    for (int j=0; j<ROW; j++) {
      stone[i][j] = 0;
    }
  }
  stone[3][3] = 1;
  stone[4][4] = 1;
  stone[4][3] = -1;
  stone[3][4] = -1;
}

void draw() {
  background(50, 100, 50);

  //DrawLine
  for (int i=0; i<COLUMN+1; i++) {
    line(i*MASSSIZE, 0, i*MASSSIZE, BOADSIZE);
  }
  for (int i=0; i<ROW+1; i++) {
    line(0, i*MASSSIZE, BOADSIZE, i*MASSSIZE);
  }

  //DrawStone
  for (int i=0; i<COLUMN; i++) {
    for (int j=0; j<ROW; j++) {
      if (stone[i][j]==0) {
      } else if (stone[i][j]==1) {
        fill(255);
        ellipse(i*MASSSIZE+0.5*MASSSIZE, j*MASSSIZE+0.5*MASSSIZE, STONESIZE, STONESIZE);
      } else if (stone[i][j]==-1) {
        fill(0);
        ellipse(i*MASSSIZE+0.5*MASSSIZE, j*MASSSIZE+0.5*MASSSIZE, STONESIZE, STONESIZE);
      }
    }
  }
  
  //ScoreInformation
  fill(255,255,255);
  textSize(20);
  text("The number of",BOADSIZE+100,100);
  text("WHITE stone",BOADSIZE+100,120);
  textSize(100);
  text(white_num,BOADSIZE+100,200);
  fill(0);
  textSize(20);
  text("The number of",BOADSIZE+100,300);
  text("BLACK stone",BOADSIZE+100,320);
  textSize(100);
  text(black_num,BOADSIZE+100,400);
}

void mousePressed() {
  print("player="+player+":");
  for (int i=0; i<COLUMN; i++) {
    for (int j=0; j<ROW; j++) {

      if (dist(mouseX, mouseY, i*MASSSIZE+0.5*MASSSIZE, j*MASSSIZE+0.5*MASSSIZE)<0.5*MASSSIZE) {
        if (stone[i][j]==0) {
          turnStone(i, j);
        }
      }
    }
  }
}

void turnStone(int ii, int jj) {
  int count_sum = 0;

  //UpCheck
  if (jj!=0) {
    if (stone[ii][jj-1]==-player) {
      int count = 0;
      for (int k=1; k<8; k++) {
        if (jj-k>=0) {
          if (stone[ii][jj-k]==0) {
            count = 0;
            break;
          } else if (stone[ii][jj-k]==-player) {
            count++;
          } else if (stone[ii][jj-k]==player) {
            if (count>0) {
              for (int l=1; l<=count; l++) {
                count_sum++;
                stone[ii][jj-l] = player;
              }
              break;
            }
          }
        }
      }
    }
  }
  //print("up"+count_sum+":");

  //DownCheck
  if (jj!=7) {
    if (stone[ii][jj+1]==-player) {
      int count = 0;
      for (int k=1; k<8; k++) {
        if (jj+k<=7) {
          if (stone[ii][jj+k]==0) {
            count = 0;
            break;
          } else if (stone[ii][jj+k]==-player) {
            count++;
          } else if (stone[ii][jj+k]==player) {
            if (count>0) {
              for (int l=1; l<=count; l++) {
                count_sum++;
                stone[ii][jj+l] = player;
              }
              break;
            }
          }
        }
      }
    }
  }
  //print("down"+count_sum+":");

  //LeftCheck
  if (ii!=0) {
    if (stone[ii-1][jj]==-player) {
      int count = 0;
      for (int k=1; k<8; k++) {
        if (ii-k>=0) {
          if (stone[ii-k][jj]==0) {
            count = 0;
            break;
          } else if (stone[ii-k][jj]==-player) {
            count++;
          } else if (stone[ii-k][jj]==player) {
            if (count>0) {
              for (int l=1; l<=count; l++) {
                count_sum++;
                stone[ii-l][jj] = player;
              }
              break;
            }
          }
        }
      }
    }
  }
  //print("left"+count_sum+":");

  //RightCheck
  if (ii!=7) {
    if (stone[ii+1][jj]==-player) {
      int count = 0;
      for (int k=1; k<8; k++) {
        if (ii+k<=7) {
          if (stone[ii+k][jj]==0) {
            count = 0;
            break;
          } else if (stone[ii+k][jj]==-player) {
            count++;
          } else if (stone[ii+k][jj]==player) {
            if (count>0) {
              for (int l=1; l<=count; l++) {
                count_sum++;
                stone[ii+l][jj] = player;
              }
              break;
            }
          }
        }
      }
    }
  }
  //print("right"+count_sum+":");

  //UpLeftCheck
  if (jj!=0 && ii!=0) {
    if (stone[ii-1][jj-1]==-player) {
      int count = 0;
      for (int k=1; k<8; k++) {
        if (jj-k>=0 && ii-k>=0) {
          if (stone[ii-k][jj-k]==0) {
            count = 0;
            break;
          } else if (stone[ii-k][jj-k]==-player) {
            count++;
          } else if (stone[ii-k][jj-k]==player) {
            if (count>0) {
              for (int l=1; l<=count; l++) {
                count_sum++;
                stone[ii-l][jj-l] = player;
              }
              break;
            }
          }
        }
      }
    }
  }
  //print("ul"+count_sum+":");

  //DownLeftCheck
  if (jj!=7 && ii!=0) {
    if (stone[ii-1][jj+1]==-player) {
      int count = 0;
      for (int k=1; k<8; k++) {
        if (jj+k<=7 && ii-k>=0) {
          if (stone[ii-k][jj+k]==0) {
            count = 0;
            break;
          } else if (stone[ii-k][jj+k]==-player) {
            count++;
          } else if (stone[ii-k][jj+k]==player) {
            if (count>0) {
              for (int l=1; l<=count; l++) {
                count_sum++;
                stone[ii-l][jj+l] = player;
              }
              break;
            }
          }
        }
      }
    }
  }
  //print("dl"+count_sum+":");

  //DownRightCheck
  if (jj!=7 && ii!=7) {
    if (stone[ii+1][jj+1]==-player) {
      int count = 0;
      for (int k=1; k<8; k++) {
        if (jj+k<=7 && ii+k<=7) {
          if (stone[ii+k][jj+k]==0) {
            count = 0;
            break;
          } else if (stone[ii+k][jj+k]==-player) {
            count++;
          } else if (stone[ii+k][jj+k]==player) {
            if (count>0) {
              for (int l=1; l<=count; l++) {
                count_sum++;
                stone[ii+l][jj+l] = player;
              }
              break;
            }
          }
        }
      }
    }
  }
  //print("dr"+count_sum+":");

  //UpRightCheck
  if (jj!=0 && ii!=7) {
    if (stone[ii+1][jj-1]==-player) {
      int count = 0;
      for (int k=1; k<8; k++) {
        if (jj-k>=0 && ii+k<=7) {
          if (stone[ii+k][jj-k]==0) {
            count = 0;
            break;
          } else if (stone[ii+k][jj-k]==-player) {
            count++;
          } else if (stone[ii+k][jj-k]==player) {
            if (count>0) {
              for (int l=1; l<=count; l++) {
                count_sum++;
                stone[ii+l][jj-l] = player;
              }
              break;
            }
          }
        }
      }
    }
  }
  //print("ur"+count_sum+":");
  println("sum="+count_sum+":");

  //playerChange
  if (count_sum>0) {
    if (player==1) {
      stone[ii][jj] = 1;
    } else if (player==-1) {
      stone[ii][jj] = -1;
    }
    player = -player;
    
    //stoneNum
    white_num = 0;
    black_num = 0;
    for (int i=0; i<COLUMN; i++) {
      for (int j=0; j<ROW; j++) {
        if(stone[i][j]==1){
          white_num++;
        }else if(stone[i][j]==-1){
          black_num++;
        }
      }
    }
  }
}

