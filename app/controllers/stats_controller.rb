class StatsController < ApplicationController
  def home
  	@user = User.find(params[:id])
  end
  def new
  	@user = User.find(params[:id])
  	@stats = Stat.new

  	# @myStats = Stat.where(user_id = session[:user_id]).all
      @lastscore = Stat.where(user_id:session[:user_id]).pluck(:hole1_score, :hole2_score, :hole3_score, :hole4_score, :hole5_score, :hole6_score, :hole7_score, :hole8_score, :hole9_score, :hole10_score, :hole11_score, :hole12_score, :hole13_score, :hole14_score, :hole15_score, :hole16_score, :hole17_score, :hole18_score).first
      @second2last = Stat.where(user_id:session[:user_id]).pluck(:hole1_score, :hole2_score, :hole3_score, :hole4_score, :hole5_score, :hole6_score, :hole7_score, :hole8_score, :hole9_score, :hole10_score, :hole11_score, :hole12_score, :hole13_score, :hole14_score, :hole15_score, :hole16_score, :hole17_score, :hole18_score).second
    	@totalScore = Stat.where(user_id:session[:user_id]).pluck(:hole1_score, :hole2_score, :hole3_score, :hole4_score, :hole5_score, :hole6_score, :hole7_score, :hole8_score, :hole9_score, :hole10_score, :hole11_score, :hole12_score, :hole13_score, :hole14_score, :hole15_score, :hole16_score, :hole17_score, :hole18_score).map(&:sum).sum
    	@count = Stat.where(user_id:session[:user_id]).count
      @averageScore = @totalScore.to_f / @count.to_f
      @score2 = Stat.where(user_id:session[:user_id]).pluck(:score)
      # @averageScore = Stat.where(user_id:session[:user_id]).average(:hole1_score)
      @green = Stat.where(user_id:session[:user_id]).where("hole1_gir != ?", "yes").count  #not working yet
  	
  end
  def create
  	@stats = Stat.new(stat_params)
  	if @stats.save
  		redirect_to :back
  	else
  		flash[:errors] = @stats.errors.full_messages
  		redirect_to :back
  	end
  end
  def show
    @user = User.find(params[:id])
    
    # score related stats
    # summary stats
    @lastscore = Stat.where(user_id:session[:user_id]).pluck(:hole1_score, :hole2_score, :hole3_score, :hole4_score, :hole5_score, :hole6_score, :hole7_score, :hole8_score, :hole9_score, :hole10_score, :hole11_score, :hole12_score, :hole13_score, :hole14_score, :hole15_score, :hole16_score, :hole17_score, :hole18_score).first
    @second2last = Stat.where(user_id:session[:user_id]).pluck(:hole1_score, :hole2_score, :hole3_score, :hole4_score, :hole5_score, :hole6_score, :hole7_score, :hole8_score, :hole9_score, :hole10_score, :hole11_score, :hole12_score, :hole13_score, :hole14_score, :hole15_score, :hole16_score, :hole17_score, :hole18_score).second
    @totalScore = Stat.where(user_id:session[:user_id]).pluck(:hole1_score, :hole2_score, :hole3_score, :hole4_score, :hole5_score, :hole6_score, :hole7_score, :hole8_score, :hole9_score, :hole10_score, :hole11_score, :hole12_score, :hole13_score, :hole14_score, :hole15_score, :hole16_score, :hole17_score, :hole18_score).map(&:sum).sum
    @count = Stat.where(user_id:session[:user_id]).count
    @totalPar = Stat.where(user_id:session[:user_id]).pluck(:hole1_par, :hole2_par, :hole3_par, :hole4_par, :hole5_par, :hole6_par, :hole7_par, :hole8_par, :hole9_par, :hole10_par, :hole11_par, :hole12_par, :hole13_par, :hole14_par, :hole15_par, :hole16_par, :hole17_par, :hole18_par).map(&:sum).sum
    @averagePar = @totalPar.to_f / @count.to_f
    @toPar = ((@totalScore.to_f - @totalPar.to_f) / @count.to_f).round(1)
    @averageScore = (@totalScore.to_f / @count.to_f).round(1)
    @score2 = Stat.where(user_id:session[:user_id]).pluck(:score)
    
    # front 9 stats
    @frontScore = Stat.where(user_id:session[:user_id]).pluck(:hole1_score, :hole2_score, :hole3_score, :hole4_score, :hole5_score, :hole6_score, :hole7_score, :hole8_score, :hole9_score).map(&:sum).sum
    @frontAverage = (@frontScore.to_f / @count.to_f).round(1)
    @frontPar = Stat.where(user_id:session[:user_id]).pluck(:hole1_par, :hole2_par, :hole3_par, :hole4_par, :hole5_par, :hole6_par, :hole7_par, :hole8_par, :hole9_par).map(&:sum).sum 
    @frontAveragePar = @frontPar.to_f / @count.to_f
    @frontToPar = ((@frontScore.to_f - @frontPar.to_f) / @count.to_f).round(1)
    
    #back 9 stats
    @backScore = Stat.where(user_id:session[:user_id]).pluck(:hole10_score, :hole11_score, :hole12_score, :hole13_score, :hole14_score, :hole15_score, :hole16_score, :hole17_score, :hole18_score).map(&:sum).sum
    @backAverage = (@backScore.to_f / @count.to_f).round(1)
    @backPar = Stat.where(user_id:session[:user_id]).pluck(:hole10_par, :hole11_par, :hole12_par, :hole13_par, :hole14_par, :hole15_par, :hole16_par, :hole17_par, :hole18_par).map(&:sum).sum 
    @backAveragePar = @backPar.to_f / @count.to_f
    @backToPar = ((@backScore.to_f - @backPar.to_f) / @count.to_f).round(1)

    #first 6 stats
    @first6score = Stat.where(user_id:session[:user_id]).pluck(:hole1_score, :hole2_score, :hole3_score, :hole4_score, :hole5_score, :hole6_score).map(&:sum).sum
    @first6average = (@first6score.to_f / @count.to_f).round(1)
    @first6Par = Stat.where(user_id:session[:user_id]).pluck(:hole1_par, :hole2_par, :hole3_par, :hole4_par, :hole5_par, :hole6_par).map(&:sum).sum 
    @first6AveragePar = @first6Par.to_f / @count.to_f
    @first6ToPar = ((@first6score.to_f - @first6Par.to_f) / @count.to_f).round(1)

    #middle 6 stats
    @middle6score = Stat.where(user_id:session[:user_id]).pluck(:hole7_score, :hole8_score, :hole9_score, :hole10_score, :hole11_score, :hole12_score).map(&:sum).sum
    @middle6average = (@middle6score.to_f / @count.to_f).round(1)
    @middle6Par = Stat.where(user_id:session[:user_id]).pluck(:hole7_par, :hole8_par, :hole9_par, :hole10_par, :hole11_par, :hole12_par).map(&:sum).sum 
    @middle6AveragePar = @middle6Par.to_f / @count.to_f
    @middle6ToPar = ((@middle6score.to_f - @middle6Par.to_f) / @count.to_f).round(1)

    #last 6 stats
    @last6score = Stat.where(user_id:session[:user_id]).pluck(:hole13_score, :hole14_score, :hole15_score, :hole16_score, :hole17_score, :hole18_score).map(&:sum).sum
    @last6average = (@last6score.to_f / @count.to_f).round(1)
    @last6Par = Stat.where(user_id:session[:user_id]).pluck(:hole13_par, :hole14_par, :hole15_par, :hole16_par, :hole17_par, :hole18_par).map(&:sum).sum 
    @last6AveragePar = @last6Par.to_f / @count.to_f
    @last6ToPar = ((@last6score.to_f - @last6Par.to_f) / @count.to_f).round(1)

    # green stats
    #overall 
    green = Stat.where(user_id:session[:user_id]).pluck(:hole1_gir, :hole2_gir, :hole3_gir, :hole4_gir, :hole5_gir, :hole6_gir, :hole7_gir, :hole8_gir, :hole9_gir, :hole10_gir, 
        :hole11_gir, :hole12_gir, :hole13_gir, :hole14_gir, :hole15_gir, :hole16_gir, :hole17_gir, :hole18_gir)
    gYesCount = 0
    gLeftCount = 0
    gRightCount = 0
    gShortCount = 0
    gLongCount = 0
    
    green.each do |nested|
      nested.each do |i|
        if i == "yes"
          gYesCount += 1
        elsif i == "left"
          gLeftCount += 1   
        elsif i == "right"
          gRightCount += 1
        elsif i == "short"
          gShortCount += 1
        else
          gLongCount += 1
        end
      end
    end
    @gir = ((gYesCount.to_f / (@count.to_f * 18)) * 100).round(1)
    @greenLeft = ((gLeftCount.to_f / (@count.to_f * 18)) * 100).round(1)
    @greenRight = ((gRightCount.to_f / (@count.to_f * 18)) * 100).round(1)
    @greenShort = ((gShortCount.to_f / (@count.to_f * 18)) * 100).round(1)
    @greenLong = ((gLongCount.to_f / (@count.to_f * 18)) * 100).round(1)

    # front 9 green stats

    green_front = Stat.where(user_id:session[:user_id]).pluck(:hole1_gir, :hole2_gir, :hole3_gir, :hole4_gir, :hole5_gir, :hole6_gir, :hole7_gir, :hole8_gir, :hole9_gir)
    gfrontYesCount = 0
    gfrontLeftCount = 0
    gfrontRightCount = 0
    gfrontShortCount = 0
    gfrontLongCount = 0
    
    green_front.each do |nested|
      nested.each do |i|
        if i == "yes"
          gfrontYesCount += 1
        elsif i == "left"
          gfrontLeftCount += 1   
        elsif i == "right"
          gfrontRightCount += 1
        elsif i == "short"
          gfrontShortCount += 1
        else
          gfrontLongCount += 1
        end
      end
    end
    @front_gir = ((gfrontYesCount.to_f / (@count.to_f * 9)) * 100).round(1)
    @front_greenLeft = ((gfrontLeftCount.to_f / (@count.to_f * 9)) * 100).round(1)
    @front_greenRight = ((gfrontRightCount.to_f / (@count.to_f * 9)) * 100).round(1)
    @front_greenShort = ((gfrontShortCount.to_f / (@count.to_f * 9)) * 100).round(1)
    @front_greenLong = ((gfrontLongCount.to_f / (@count.to_f * 9)) * 100).round(1)

    # back 9 green stats

    green_back = Stat.where(user_id:session[:user_id]).pluck(:hole10_gir, :hole11_gir, :hole12_gir, :hole13_gir, :hole14_gir, :hole15_gir, :hole16_gir, :hole17_gir, :hole18_gir)
    gbackYesCount = 0
    gbackLeftCount = 0
    gbackRightCount = 0
    gbackShortCount = 0
    gbackLongCount = 0
    
    green_back.each do |nested|
      nested.each do |i|
        if i == "yes"
          gbackYesCount += 1
        elsif i == "left"
          gbackLeftCount += 1   
        elsif i == "right"
          gbackRightCount += 1
        elsif i == "short"
          gbackShortCount += 1
        else
          gbackLongCount += 1
        end
      end
    end
    @back_gir = ((gbackYesCount.to_f / (@count.to_f * 9)) * 100).round(1)
    @back_greenLeft = ((gbackLeftCount.to_f / (@count.to_f * 9)) * 100).round(1)
    @back_greenRight = ((gbackRightCount.to_f / (@count.to_f * 9)) * 100).round(1)
    @back_greenShort = ((gbackShortCount.to_f / (@count.to_f * 9)) * 100).round(1)
    @back_greenLong = ((gbackLongCount.to_f / (@count.to_f * 9)) * 100).round(1)

    # first 6 green stats

    green_first6 = Stat.where(user_id:session[:user_id]).pluck(:hole1_gir, :hole2_gir, :hole3_gir, :hole4_gir, :hole5_gir, :hole6_gir)
    gfirst6YesCount = 0
    gfirst6LeftCount = 0
    gfirst6RightCount = 0
    gfirst6ShortCount = 0
    gfirst6LongCount = 0
    
    green_first6.each do |nested|
      nested.each do |i|
        if i == "yes"
          gfirst6YesCount += 1
        elsif i == "left"
          gfirst6LeftCount += 1   
        elsif i == "right"
          gfirst6RightCount += 1
        elsif i == "short"
          gfirst6ShortCount += 1
        else
          gfirst6LongCount += 1
        end
      end
    end
    @first6_gir = ((gfirst6YesCount.to_f / (@count.to_f * 6)) * 100).round(1)
    @first6_greenLeft = ((gfirst6LeftCount.to_f / (@count.to_f * 6)) * 100).round(1)
    @first6_greenRight = ((gfirst6RightCount.to_f / (@count.to_f * 6)) * 100).round(1)
    @first6_greenShort = ((gfirst6ShortCount.to_f / (@count.to_f * 6)) * 100).round(1)
    @first6_greenLong = ((gfirst6LongCount.to_f / (@count.to_f * 6)) * 100).round(1)

     # middle 6 green stats

    green_middle6 = Stat.where(user_id:session[:user_id]).pluck(:hole7_gir, :hole8_gir, :hole9_gir, :hole10_gir, :hole11_gir, :hole12_gir)
    gmiddle6YesCount = 0
    gmiddle6LeftCount = 0
    gmiddle6RightCount = 0
    gmiddle6ShortCount = 0
    gmiddle6LongCount = 0
    
    green_middle6.each do |nested|
      nested.each do |i|
        if i == "yes"
          gmiddle6YesCount += 1
        elsif i == "left"
          gmiddle6LeftCount += 1   
        elsif i == "right"
          gmiddle6RightCount += 1
        elsif i == "short"
          gmiddle6ShortCount += 1
        else
          gmiddle6LongCount += 1
        end
      end
    end
    @middle6_gir = ((gmiddle6YesCount.to_f / (@count.to_f * 6)) * 100).round(1) 
    @middle6_greenLeft = ((gmiddle6LeftCount.to_f / (@count.to_f * 6)) * 100).round(1)
    @middle6_greenRight = ((gmiddle6RightCount.to_f / (@count.to_f * 6)) * 100).round(1)
    @middle6_greenShort = ((gmiddle6ShortCount.to_f / (@count.to_f * 6)) * 100).round(1)
    @middle6_greenLong = ((gmiddle6LongCount.to_f / (@count.to_f * 6)) * 100).round(1)

     # last 6 green stats

    green_last6 = Stat.where(user_id:session[:user_id]).pluck(:hole13_gir, :hole14_gir, :hole15_gir, :hole16_gir, :hole17_gir, :hole18_gir)
    glast6YesCount = 0
    glast6LeftCount = 0
    glast6RightCount = 0
    glast6ShortCount = 0
    glast6LongCount = 0
    
    green_last6.each do |nested|
      nested.each do |i|
        if i == "yes"
          glast6YesCount += 1
        elsif i == "left"
          glast6LeftCount += 1   
        elsif i == "right"
          glast6RightCount += 1
        elsif i == "short"
          glast6ShortCount += 1
        else
          glast6LongCount += 1
        end
      end
    end
    @last6_gir = ((glast6YesCount.to_f / (@count.to_f * 6)) * 100).round(1)
    @last6_greenLeft = ((glast6LeftCount.to_f / (@count.to_f * 6)) * 100).round(1)
    @last6_greenRight = ((glast6RightCount.to_f / (@count.to_f * 6)) * 100).round(1)
    @last6_greenShort = ((glast6ShortCount.to_f / (@count.to_f * 6)) * 100).round(1)
    @last6_greenLong = ((glast6LongCount.to_f / (@count.to_f * 6)) * 100).round(1)



    #fairway stats
    #overall
    fairway = Stat.where(user_id:session[:user_id]).pluck(:hole1_fway, :hole2_fway, :hole3_fway, :hole4_fway, :hole5_fway, :hole6_fway, :hole7_fway, :hole8_fway, :hole9_fway, :hole10_fway, 
        :hole11_fway, :hole12_fway, :hole13_fway, :hole14_fway, :hole15_fway, :hole16_fway, :hole17_fway, :hole18_fway)


    fYesCount = 0
    fLeftCount = 0
    fRightCount = 0
    nulCount = 0

    fairway.each do |nested|
      nested.each do |i|
        if i == "yes"
          fYesCount += 1
        elsif i == "left"
          fLeftCount += 1
        elsif i == "right"
          fRightCount += 1
        else
          nulCount += 1
        end
      end
    end
    @fairway = ((fYesCount.to_f / ((@count.to_f * 18) - nulCount)) * 100).round(1)
    @fairwayLeft = ((fLeftCount.to_f / ((@count.to_f * 18) - nulCount)) * 100).round(1)
    @fairwayRight = ((fRightCount.to_f / ((@count.to_f * 18) - nulCount)) * 100).round(1)

    #fairway front
    fairwayFront = Stat.where(user_id:session[:user_id]).pluck(:hole1_fway, :hole2_fway, :hole3_fway, :hole4_fway, :hole5_fway, :hole6_fway, :hole7_fway, :hole8_fway, :hole9_fway)

    fFrontYesCount = 0
    fFrontLeftCount = 0
    fFrontRightCount = 0
    fFrontnulCount = 0

    fairwayFront.each do |nested|
      nested.each do |i|
        if i == "yes"
          fFrontYesCount += 1
        elsif i == "left"
          fFrontLeftCount += 1
        elsif i == "right"
          fFrontRightCount += 1
        else
          fFrontnulCount += 1
        end
      end
    end
    @FrontFairway = ((fFrontYesCount.to_f / ((@count.to_f * 9) - fFrontnulCount)) * 100).round(1)
    @FrontFairwayLeft = ((fFrontLeftCount.to_f / ((@count.to_f * 9) - fFrontnulCount)) * 100).round(1)
    @FrontFairwayRight = ((fFrontRightCount.to_f / ((@count.to_f * 9) - fFrontnulCount)) * 100).round(1)

    #fairway back
    fairwayBack = Stat.where(user_id:session[:user_id]).pluck(:hole10_fway, :hole11_fway, :hole12_fway, :hole13_fway, :hole14_fway, :hole15_fway, :hole16_fway, :hole17_fway, :hole18_fway)

    fBackYesCount = 0
    fBackLeftCount = 0
    fBackRightCount = 0
    fBacknulCount = 0

    fairwayBack.each do |nested|
      nested.each do |i|
        if i == "yes"
          fBackYesCount += 1
        elsif i == "left"
          fBackLeftCount += 1
        elsif i == "right"
          fBackRightCount += 1
        else
          fBacknulCount += 1
        end
      end
    end
    @BackFairway = ((fBackYesCount.to_f / ((@count.to_f * 9) - fBacknulCount)) * 100).round(1)
    @BackFairwayLeft = ((fBackLeftCount.to_f / ((@count.to_f * 9) - fBacknulCount)) * 100).round(1)
    @BackFairwayRight = ((fBackRightCount.to_f / ((@count.to_f * 9) - fBacknulCount)) * 100).round(1)

    #fairway first 6 *************************************************************************************************************
    fairwayFirst6 = Stat.where(user_id:session[:user_id]).pluck(:hole1_fway, :hole2_fway, :hole3_fway, :hole4_fway, :hole5_fway, :hole6_fway)

    fFirst6YesCount = 0
    fFirst6LeftCount = 0
    fFirst6RightCount = 0
    fFirst6nulCount = 0

    fairwayFirst6.each do |nested|
      nested.each do |i|
        if i == "yes"
          fFirst6YesCount += 1
        elsif i == "left"
          fFirst6LeftCount += 1
        elsif i == "right"
          fFirst6RightCount += 1
        else
          fFirst6nulCount += 1
        end
      end
    end
    @First6Fairway = ((fFirst6YesCount.to_f / ((@count.to_f * 6) - fFirst6nulCount)) * 100).round(1)
    @First6FairwayLeft = ((fFirst6LeftCount.to_f / ((@count.to_f * 6) - fFirst6nulCount)) * 100).round(1)
    @First6FairwayRight = ((fFirst6RightCount.to_f / ((@count.to_f * 6) - fFirst6nulCount)) * 100).round(1)

    #fairway middle 6 ************************************************************************************************************
    fairwayMiddle6 = Stat.where(user_id:session[:user_id]).pluck(:hole7_fway, :hole8_fway, :hole9_fway, :hole10_fway, :hole11_fway, :hole12_fway)

    fMiddle6YesCount = 0
    fMiddle6LeftCount = 0
    fMiddle6RightCount = 0
    fMiddle6nulCount = 0

    fairwayMiddle6.each do |nested|
      nested.each do |i|
        if i == "yes"
          fMiddle6YesCount += 1
        elsif i == "left"
          fMiddle6LeftCount += 1
        elsif i == "right"
          fMiddle6RightCount += 1
        else
          fMiddle6nulCount += 1
        end
      end
    end
    @Middle6Fairway = ((fMiddle6YesCount.to_f / ((@count.to_f * 6) - fMiddle6nulCount)) * 100).round(1)
    @Middle6FairwayLeft = ((fMiddle6LeftCount.to_f / ((@count.to_f * 6) - fMiddle6nulCount)) * 100).round(1)
    @Middle6FairwayRight = ((fMiddle6RightCount.to_f / ((@count.to_f * 6) - fMiddle6nulCount)) * 100).round(1)

    #fairway last 6 ***********************************************************************************************************
    fairwayLast6 = Stat.where(user_id:session[:user_id]).pluck(:hole13_fway, :hole14_fway, :hole15_fway, :hole16_fway, :hole17_fway, :hole18_fway)

    fLast6YesCount = 0
    fLast6LeftCount = 0
    fLast6RightCount = 0
    fLast6nulCount = 0

    fairwayLast6.each do |nested|
      nested.each do |i|
        if i == "yes"
          fLast6YesCount += 1
        elsif i == "left"
          fLast6LeftCount += 1
        elsif i == "right"
          fLast6RightCount += 1
        else
          fLast6nulCount += 1
        end
      end
    end
    @Last6Fairway = ((fLast6YesCount.to_f / ((@count.to_f * 6) - fLast6nulCount)) * 100).round(1)
    @Last6FairwayLeft = ((fLast6LeftCount.to_f / ((@count.to_f * 6) - fLast6nulCount)) * 100).round(1)
    @Last6FairwayRight = ((fLast6RightCount.to_f / ((@count.to_f * 6) - fLast6nulCount)) * 100).round(1)
   

    #putting stats ****************************************************************************************************************
    @totalPutts = Stat.where(user_id:session[:user_id]).pluck(:hole1_putts, :hole2_putts, :hole3_putts, :hole4_putts, :hole5_putts, :hole6_putts, :hole7_putts, :hole8_putts, :hole9_putts, :hole10_putts, :hole11_putts, :hole12_putts, :hole13_putts, :hole14_putts, :hole15_putts, :hole16_putts, :hole17_putts, :hole18_putts).map(&:sum).sum
    @averagePutts = (@totalPutts.to_f / @count.to_f).round(1)
    
    @frontPutts = Stat.where(user_id:session[:user_id]).pluck(:hole1_putts, :hole2_putts, :hole3_putts, :hole4_putts, :hole5_putts, :hole6_putts, :hole7_putts, :hole8_putts, :hole9_putts).map(&:sum).sum
    @frontAvePutts = (@frontPutts.to_f / @count.to_f).round(1)
    
    @backPutts = Stat.where(user_id:session[:user_id]).pluck(:hole10_putts, :hole11_putts, :hole12_putts, :hole13_putts, :hole14_putts, :hole15_putts, :hole16_putts, :hole17_putts, :hole18_putts).map(&:sum).sum
    @backAvePutts = (@backPutts.to_f / @count.to_f).round(1)

    @first6Putts = Stat.where(user_id:session[:user_id]).pluck(:hole1_putts, :hole2_putts, :hole3_putts, :hole4_putts, :hole5_putts, :hole6_putts).map(&:sum).sum
    @first6AvePutts = (@first6Putts.to_f / @count.to_f).round(1)

    @middle6Putts = Stat.where(user_id:session[:user_id]).pluck(:hole7_putts, :hole8_putts, :hole9_putts, :hole10_putts, :hole11_putts, :hole12_putts).map(&:sum).sum
    @middle6AvePutts = (@middle6Putts.to_f / @count.to_f).round(1)

    @last6Putts = Stat.where(user_id:session[:user_id]).pluck(:hole13_putts, :hole14_putts, :hole15_putts, :hole16_putts, :hole17_putts, :hole18_putts).map(&:sum).sum
    @last6AvePutts = (@last6Putts.to_f / @count.to_f).round(1)
    
    #par save stats ****************************************************************************************************************
    up_down = Stat.where(user_id:session[:user_id]).sum(:up_down)
    @up_down = (up_down.to_f / @count.to_f).round(1) 
    @sand_attempt = Stat.where(user_id:session[:user_id]).sum(:sand_attempt)
    @sand_save = Stat.where(user_id:session[:user_id]).sum(:sand_save)
    sand_save = (@sand_save.to_f / @sand_attempt.to_f) * 100
    @sand_percent = (@sand_save.to_f / @sand_attempt.to_f) * 100
    

    #penalties ************************************************************************************************************************
    @penalties = ((Stat.where(user_id:session[:user_id]).sum(:penalties)).to_f / @count.to_f).round(1)


    # *********************************************************************************************************************************
    # *********************************************************************************************************************************
    # *********************************************************************************************************************************
    # *********************************************************************************************************************************
    # *********************************************************************************************************************************

    # last round
    lastScore = Stat.where(user_id:session[:user_id]).pluck(:hole1_score, :hole2_score, :hole3_score, :hole4_score, :hole5_score, :hole6_score, :hole7_score, :hole8_score, :hole9_score, :hole10_score, :hole11_score, :hole12_score, :hole13_score, :hole14_score, :hole15_score, :hole16_score, :hole17_score, :hole18_score).last
    @lastScore = lastScore.sum
    @lastScoreFront = 0
    for i in 0..8
      @lastScoreFront += lastScore[i]
    end
    @lastScoreBack = 0
    for i in 9..17
      @lastScoreBack += lastScore[i]
    end
    @lastScoreFirst6 = 0
    for i in 0..5 
      @lastScoreFirst6 += lastScore[i]
    end
    @lastScoreMiddle6 = 0
    for i in 6..11
      @lastScoreMiddle6 += lastScore[i]
    end
    @lastScoreLast6 = 0
    for i in 12..17
      @lastScoreLast6 += lastScore[i]
    end

    # to par
    lastRoundTotalPar = Stat.where(user_id:session[:user_id]).pluck(:hole1_par, :hole2_par, :hole3_par, :hole4_par, :hole5_par, :hole6_par, :hole7_par, :hole8_par, :hole9_par, :hole10_par, :hole11_par, :hole12_par, :hole13_par, :hole14_par, :hole15_par, :hole16_par, :hole17_par, :hole18_par).last
    @lastTotalPar = lastRoundTotalPar.sum
    @lastToPar = @lastScore - @lastTotalPar
    lastTotalParFront = 0
    for i in 0..8
      lastTotalParFront += lastRoundTotalPar[i]
    end
    @lastToParFront = @lastScoreFront - lastTotalParFront

    lastTotalParBack = 0
    for i in 9..17
      lastTotalParBack += lastRoundTotalPar[i]
    end
    @lastToParBack = @lastScoreBack - lastTotalParBack

    lastTotalParFirst6 = 0
    for i in 0..5
      lastTotalParFirst6 += lastRoundTotalPar[i]
    end
    @lastToParFirst6 = @lastScoreFirst6 - lastTotalParFirst6

    lastTotalParMiddle6 = 0
    for i in 6..11
      lastTotalParMiddle6 += lastRoundTotalPar[i]
    end
    @lastToParMiddle6 = @lastScoreMiddle6 - lastTotalParMiddle6

    lastTotalParLast6 = 0
    for i in 12..17
      lastTotalParLast6 += lastRoundTotalPar[i]
    end
    @lastToParLast6 = @lastScoreLast6 - lastTotalParLast6


    # **********************************************************************************************************************************
    # **********************************************************************************************************************************
    # **********************************************************************************************************************************
    # **********************************************************************************************************************************
    # **********************************************************************************************************************************

    # last 5 rounds
    last5Score = Stat.where(user_id:session[:user_id]).pluck(:hole1_score, :hole2_score, :hole3_score, :hole4_score, :hole5_score, :hole6_score, :hole7_score, :hole8_score, :hole9_score, :hole10_score, :hole11_score, :hole12_score, :hole13_score, :hole14_score, :hole15_score, :hole16_score, :hole17_score, :hole18_score).last(5)
    @last5Score = last5Score.sum.sum
    @last5AveScore = @last5Score.to_f / last5Score.count 
    totalParLast5Rounds = Stat.where(user_id:session[:user_id]).pluck(:hole1_par, :hole2_par, :hole3_par, :hole4_par, :hole5_par, :hole6_par, :hole7_par, :hole8_par, :hole9_par, :hole10_par, :hole11_par, :hole12_par, :hole13_par, :hole14_par, :hole15_par, :hole16_par, :hole17_par, :hole18_par).last(5)
    @totalParLast5Rounds = totalParLast5Rounds.sum.sum
    @toParLast5Rounds = (@last5Score.to_f - @totalParLast5Rounds.to_f) / totalParLast5Rounds.count

    # fairways
    last5Fairways = Stat.where(user_id:session[:user_id]).pluck(:hole1_fway, :hole2_fway, :hole3_fway, :hole4_fway, :hole5_fway, :hole6_fway, :hole7_fway, :hole8_fway, :hole9_fway, :hole10_fway, :hole11_fway, :hole12_fway, :hole13_fway, :hole14_fway, :hole15_fway, :hole16_fway, :hole17_fway, :hole18_fway).last(5)

    last5fYesCount = 0
    last5fLeftCount = 0
    last5fRightCount = 0
    last5nulCount = 0

    last5Fairways.each do |nested|
      nested.each do |i|
        if i == "yes"
          last5fYesCount += 1
        elsif i == "left"
          last5fLeftCount += 1
        elsif i == "right"
          last5fRightCount += 1
        else
          last5nulCount += 1
        end
      end
    end
    @last5Fairway = ((last5fYesCount.to_f / ((last5Fairways.count * 18) - last5nulCount)) * 100).round(1)
    @last5FairwayLeft = ((last5fLeftCount.to_f / ((last5Fairways.count * 18) - last5nulCount)) * 100).round(1)
    @last5FairwayRight = ((last5fRightCount.to_f / ((last5Fairways.count * 18) - last5nulCount)) * 100).round(1)
   




    render :layout => false
  end
  private
    def stat_params
    	params.require(:stat).permit(:user_id, :course, :date, :score, :penalties, :up_down, :sand_attempt, :sand_save, :holed_putt_length, :hole1_par, 
    		:hole2_par, :hole3_par, :hole4_par, :hole5_par, :hole6_par, :hole7_par, :hole8_par, :hole9_par, :hole10_par, :hole11_par, :hole12_par, 
    		:hole13_par, :hole14_par, :hole15_par, :hole16_par, :hole17_par, :hole18_par, :hole1_score, :hole2_score, :hole3_score, :hole4_score, 
    		:hole5_score, :hole6_score, :hole7_score, :hole8_score, :hole9_score, :hole10_score, :hole11_score, :hole12_score, :hole13_score, :hole14_score, :hole15_score, 
    		:hole16_score, :hole17_score, :hole18_score, :hole1_fway, :hole2_fway, :hole3_fway, :hole4_fway, :hole5_fway, :hole6_fway, :hole7_fway, 
    		:hole8_fway, :hole9_fway, :hole10_fway, :hole11_fway, :hole12_fway, :hole13_fway, :hole14_fway, :hole15_fway, :hole16_fway, :hole17_fway, 
    		:hole18_fway, :hole1_gir, :hole2_gir, :hole3_gir, :hole4_gir, :hole5_gir, :hole6_gir, :hole7_gir, :hole8_gir, :hole9_gir, :hole10_gir, 
    		:hole11_gir, :hole12_gir, :hole13_gir, :hole14_gir, :hole15_gir, :hole16_gir, :hole17_gir, :hole18_gir, :hole1_putts, :hole2_putts, :hole3_putts, 
    		:hole4_putts, :hole5_putts, :hole6_putts, :hole7_putts, :hole8_putts, :hole9_putts, :hole10_putts, :hole11_putts, :hole12_putts, :hole13_putts, 
    		:hole14_putts, :hole15_putts, :hole16_putts, :hole17_putts, :hole18_putts)
    	
    end
end


