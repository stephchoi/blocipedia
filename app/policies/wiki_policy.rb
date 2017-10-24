class WikiPolicy < ApplicationPolicy
    attr_reader :user, :wiki

    def initialize(user, wiki)
        @user = user
        @wiki = wiki
    end
    
    def destroy?
        user.present? && (user.admin? or user == wiki.user)
    end
    
    def update?
        user.present? && (user.admin? or user == wiki.user)
    end
    
    class Scope
        attr_reader :user, :scope
 
        def initialize(user, scope)
            @user = user
            @scope = scope
        end
 
        def resolve
            wikis = []
            if user.role == 'admin'
                wikis = scope.all # if the user is an admin, show them all the wikis
            elsif user.role == 'premium'
                all_wikis = scope.all
                all_wikis.each do |wiki|
                    if !wiki.private? || wiki.user == user || wiki.collaboratoring_users.include?(user)
                        wikis << wiki # if the user is premium, only show them public wikis, private wikis they created, or private wikis they are a collaborator on
                    end
                end
            else # standard user
                all_wikis = scope.all
                wikis = []
                all_wikis.each do |wiki|
                    if !wiki.private? || wiki.collaboratoring_users.include?(user)
                        wikis << wiki # only show standard users public wikis and private wikis they are a collaborator on
                    end
                end
            end
            wikis # return the wikis array we've built up
        end
    end
end