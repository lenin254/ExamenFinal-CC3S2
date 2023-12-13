describe MoviesController do
    describe 'searching TMDb' do
      it 'calls the model method that performs TMDb search' do
        expect(Movie).to receive(:search_tmdb).with('search_terms')
        get :search_tmdb, params: { search_terms: 'search_terms' }
        get :search_tmdb, params: { search_terms: 'hardware' }
      end



      it 'selects the Search Results template for rendering' do
        # Espera que la plantilla de vista correcta sea renderizada
        get :search_tmdb
        expect(response).to render_template('search_tmdb_results')
      end

      it 'makes the TMDb search results available to that template' do
        # Verifica que los resultados de búsqueda estén disponibles en la vista
        allow(Movie).to receive(:search_tmdb).and_return(['result1', 'result2'])
        get :search_tmdb
        expect(assigns(:search_results)).to eq(['result1', 'result2'])
      end
    end
  end