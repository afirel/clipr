describe 'clipr management', type: :request do

  context '#create' do
    it 'creates a new text clip' do
      post '/clip', 'test'
      id = JSON.parse(response.body)['id']

      get "/clip/#{id}"
      expect(response.body).to eq('test')
    end
  end

  context '#get' do
    it 'returns 404 if clip not found' do
      get "/clip/something-not-present"
      expect(response.code).to eq('404')
    end
  end

end
