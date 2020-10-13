require 'rails_helper'

describe MoviesController do
    before :each do
        @movie_1 = {:title => 'Star Wars', :director => 'George Lucas'}
    	@movie_2 = {:title => 'Alien'}
    	@movie_3 = {:title => 'Blade Runner',:director => 'Ridley Scott'}
    	@movie_4 = {:title => 'THX-1138', :director => 'George Lucas'}
    end  
    
    describe 'find movies same director ' do
        context "when the specified movie has a director" do
            let(:movie1) { instance_double(Movie, @movie_3) }
            it " should find movies by the same director" do 
                expect(Movie).to receive(:find).with('1').and_return(movie1)
                expect(movie1).to receive(:director).and_return('Ridley Scott')
                expect(Movie).to receive(:with_director).with('Ridley Scott')
                get (:with_same_director),  :movie_id => 1
                expect(response).to render_template(:with_same_director)
            end
        end
        context "when movie has no director" do
            let(:movie2) { instance_double(Movie, @movie_2) }
            it "should redirect to home page" do
                expect(Movie).to receive(:find).with('2').and_return(movie2)
                expect(movie2).to receive(:director).and_return(nil)
                get (:with_same_director), :movie_id => 2
                expect(response).to redirect_to(movies_path)
            end
        end
    end
end