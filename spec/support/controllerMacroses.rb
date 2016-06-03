module ControllerMacros

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods

    def it_renders_404_if_page_not_found(*actions)
      actions.each do |a|
        it "#{a} render 404 page" do
          verb = if a == :update
                   "PATCH"
                 elsif a == :destroy
                   "DELETE"
                 else
                   "GET"
                 end
          process a, verb, {id: 0}
          expect(response.status).to eq 404
        end
      end
    end

  end

end