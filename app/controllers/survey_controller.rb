class SurveyController < ApplicationController

    def index
        
    end
    
    def createtitle
        
    end
    def createq
        
        if params[:title] != nil
            @example = Example.where(question_id: params[:title])
            
            a = Question.where(title: params[:title]).all
            if a.length != 0
                redirect_to '/createtitle'
            else
                Question.create(quser_id: current_quser.id, title: params[:title])
            end
            
            
    
            @title = params[:title]
            @questions = Question.where(title: params[:title])
            @questionaires = Questionaire.where(question_id: @questions[0].id).all
        else
            @title = Tempdatum.last.temptitle
        end

    end
    
    def createe
        if params[:titleindex] == 'done'
            @title = params[:title]
        else
            @title = Tempdatum.last.temptitle
        end
        @questions = Question.where(title: @title)

        @questionaires = Questionaire.where(question_id: @questions[0].id).all        
        if params[:titleindex] == 'done'
            Questionaire.create(question_id: @questions[0].id, option: params[:qtitle])
            Tempdatum.create(temptitle: @title, tempid: @questionaires.last.id)
        end
        if params[:index2] == 'done'
            if params[:option] != ''
                Example.create(questionaire_id: @questionaires.last.id, pick: params[:option], snum: 0)
                Tempdatum.create(temptitle: @title, tempid: @questionaires.last.id)
            end
            redirect_to '/createq'
        elsif params[:index2] == 'add'
            if params[:option] != ''        
                Example.create(questionaire_id: @questionaires.last.id, pick: params[:option], snum: 0)
                Tempdatum.create(temptitle: @title, tempid: @questionaires.last.id)
            end
        end
        a = Tempdatum.last
        if a!= nil && params[:index] != 'done'
            @example = Example.where(questionaire_id: a.tempid)
        end
    end
    
    def answerq
        @check = Check.where(auser_id: current_auser.id)
        @qlist = Question.all
    end
    def show
        
        
        @question = Question.find(params[:id])
        @questionaire = @question.questionaires
    end
    def answerqnaire
        params[:selectedid].each do |temp|
            selectede = Example.where(id: temp)
            selectede.each_with_index do |p, index|
                p.snum += 1
                p.save
            end
        end
        Check.create(auser_id: current_auser.id, question_id: params[:qid])
        redirect_to '/answerq'
    end
    def result
        @questiontitle = Question.where(quser_id: current_quser.id)
        
    end
end
