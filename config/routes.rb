TicTacToe::Application.routes.draw do
  root to: 'games#index'

  match '/new',    to: 'games#new'
end
