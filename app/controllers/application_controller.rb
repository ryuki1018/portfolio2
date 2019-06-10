class ApplicationController < ActionController::Base
    include SessionsHelper
    
    def require_user_logged_in
        unless logged_in?
          redirect_to login_url
        end
    end
    
    def counts(user)
        @counts_visit_spots = user.visits.count
        

        @counts_visit_osaka = user.likes.where(prefecture: '大阪').count
        @counts_visit_hyogo = user.likes.where(prefecture: '兵庫').count
        @counts_visit_nara = user.likes.where(prefecture: '奈良').count
        @counts_visit_kyoto = user.likes.where(prefecture: '京都').count
       

    end
end
