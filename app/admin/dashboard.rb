ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => ("Candidate Details")  do
#    div :class => "blank_slate_container", :id => "dashboard_default_message" do
#      span :class => "blank_slate" do
#        span I18n.t("active_admin.dashboard_welcome.welcome")
#        small I18n.t("active_admin.dashboard_welcome.call_to_action")
#      end
#    end

    
    columns do
      column do
        panel "" do
           
          table do
            thead do
              tr do
                th "Name"
                th "Contact"
                th "Email"
              end 
            end
            tbody do
              CandidateForm.all.each do |candidate_form|
                tr do
                  td link_to(candidate_form.name, admin_candidate_form_path(candidate_form))
                  td candidate_form.contact
                  td candidate_form.email
                end
              end
            end
          end
        end
       # strong { link_to "View All Courses", admin_courses_path } 
      end
    end
    
    
    
    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
