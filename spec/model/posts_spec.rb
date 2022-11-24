require 'rails_helper'


RSpec.describe Post, type: :model do
    context "Validar titulo do post" do
        it "Ele seja valido" do
            post = Post.new(title: 'Primeiro post', content: 'Conteudo')
            expect(post).to be_valid
        end

        it "Ele não seja valido" do
            post = Post.new(content: 'Conteudo')
            expect(post).to_not be_valid
        end

        it 'e retorna não pode ser em branco' do
            post = Post.new(title: nil)
            post.valid?
            expect(post.errors[:title]).to include("can't be blank")
        end
    end

    context "Validar conteúdo do post" do
        it "Ele seja valido" do
            post = Post.new(title: 'Primeiro post', content: 'Conteudo')
            expect(post).to be_valid
        end

        it "Ele não seja valido" do
            post = Post.new(title: 'Primeiro post')
            expect(post).to_not be_valid
        end

        it 'e retorna não pode ser em branco' do
            post = Post.new(content: nil)
            post.valid?
            expect(post.errors[:content]).to include("can't be blank")
        end
    end
end