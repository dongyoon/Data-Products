hrr_plot <- function(x,min = 300,xRange = c(0,1500),yRange = c(0,400),main_title="HRR graph"){

  library(gtools)
  #load the HRR data
  hrr <- read.csv("./data/HRR.csv",header=TRUE)
  hrr2 <- read.csv("./data/HRR2.csv",header=TRUE)
  hrrBy5 <- read.csv("./data/HRRby5.csv",header=TRUE)
  
  #transpose each table
  hrr <- t(hrr[])
  hrr2 <- t(hrr2[])
  hrrBy5 <- t(hrrBy5[])
  #head(hrr[,1:6])
  #assign column names to each table: first column is index, and the rests represent time
  num_hrr <- min(ncol(hrr),ncol(hrr2))
  hrr<-hrr[,1:num_hrr]
  hrr2<-hrr2[,1:num_hrr]
  hrrBy5<-hrrBy5[,1:ncol(hrrBy5)]
  colnames(hrr)<-c("index",1:(num_hrr-1))
  colnames(hrr2)<-c("index",1:(num_hrr-1))
  colnames(hrrBy5)<-c("index",1:(ncol(hrrBy5)-1))
  hrr <- rbind(hrr,hrr2)
  
  m <- hrr
  
  xName <- "Time(s)"
  yName <- "HRR(kW/m^2)"
  
  par(new=FALSE)
  for(i in m[,1])
  {
    for(j in x)
    {
      if(i==j) 
      {
        temp <- m[m[,1]==i,]
        lim <- length(temp)
        plot(0:(lim-2),temp[2:lim],xlim=xRange,ylim=yRange,xlab=xName,ylab=yName,type="l", col=i,pch=19)
        #plot(seq(0,5*(lim-2),5),temp[2:lim],xlim=xRange,ylim=yRange,xlab=xName,ylab=yName,type="l", col=i,pch=19)
        if(min=="no"){min=lim}
        phrr1<-round(max(temp[2:min],na.rm=TRUE),2)
        tphrr1<-which.max((temp[2:min]))-1
        text(paste(phrr1,tphrr1,sep="/"),x=tphrr1,y=phrr1)    
        if(min!=lim)
        {
          phrr2<-round(max(temp[min:lim],na.rm=TRUE),2)
          tphrr2<-which.max((temp[min:lim]))-1  
          text(paste(phrr2,tphrr2+min,sep="/"),x=tphrr2+min,y=phrr2)
        }
        par(new=TRUE)
      }
    }
  }
  
  #legend("topright",legend=x,col=x,pch=19)
  #title(main_title)
  
  par(new=FALSE)
  for(i in hrrBy5[,1])
  {
    for(j in x)
    {
      if(i==j) 
      {
        temp <- hrrBy5[hrrBy5[,1]==i,]
        lim <- length(temp)
        plot(seq(0,5*(lim-2),5),temp[2:lim],xlim=xRange,ylim=yRange,xlab=xName,ylab=yName,type="l", col=i,pch=19)
        #plot(seq(0,5*(lim-2),5),temp[2:lim],xlim=xRange,ylim=yRange,xlab=xName,ylab=yName,type="l", col=i,pch=19)
        if(min=="no"){min_temp=lim}
        else {min_temp=min/5}
        phrr1<-round(max(temp[2:min_temp],na.rm=TRUE),2)
        tphrr1<-5*(which.max((temp[2:min_temp]))-1)
        text(paste(phrr1,tphrr1,sep="/"),x=tphrr1,y=phrr1)    
        if(min_temp!=lim)
        {
          phrr2<-round(max(temp[min_temp:lim],na.rm=TRUE),2)
          tphrr2<-5*(which.max((temp[min_temp:lim]))-3)  
          text(paste(phrr2,tphrr2+min,sep="/"),x=tphrr2+min,y=phrr2)
        }
        par(new=TRUE)
      }
    }
  }
  
  legend("topright",legend=x,col=x,pch=19)
  title(main_title)
    
}


fr_acc_data <- function(id){
  #load data
  cone_test <- read.csv("./data/cone_test.csv", header = TRUE,as.is=TRUE) 

  #check the validity of cable id list
  
  if(!(id %in% cone_test$cone_test_id)) stop(paste("invalid cable id ->",id))
  
  #data process
  #cone_test$flame.acc1<-as.numeric(cone_test$flame.acc1)
  #cone_test$flame.acc2<-as.numeric(cone_test$flame.acc2)
    
  cone_dt <- cone_test[cone_test$cone_test_id==id,]
  
  return(cone_dt)
}
