require 'rails_helper'
describe Movie do
  before :each do
    @movie_1 = {:title => 'Star Wars', :director => 'George Lucas'}
    @movie_2 = {:title => 'Alien'}
    @movie_3 = {:title => 'Blade Runner', :director => 'Ridley Scott'}
    @movie_4 = {:title => 'THX-1138',:director => 'George Lucas'}

    
  end    
  describe 'finding movies same director' do 
    context "it should find movies by the same director" do
      let(:movie1) { instance_double(Movie, @movie_1) }
      let(:movie4) { instance_double(Movie, @movie_4) }
        it 'find movies whose director matches' do
          expect(Movie).to receive(:where).with(director: movie1.director).and_return(movie4)
          Movie.with_director(movie1.director)
      end 
    end
    context "should not find movies by different directors" do 
      let(:movie1) { instance_double(Movie, @movie_1) }
      let(:movie3) { instance_double(Movie, @movie_3) }
        it 'find movies whose director matches' do
          expect(Movie.with_director(movie1.director)).not_to include(movie3)
          Movie.with_director(movie1.director)
      end 
    end
  end
end