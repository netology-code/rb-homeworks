require 'rails_helper'

describe BooksController do
  specify { expect(get: '/books').to route_to(controller: 'books', action: 'index') }
  specify { expect(get: '/books/1').to route_to(controller: 'books', action: 'show', id: '1') }
  specify { expect(get: '/books/new').to route_to(controller: 'books', action: 'new') }
  specify { expect(get: '/books/1/edit').to route_to(controller: 'books', action: 'edit', id: '1') }
  specify { expect(post: '/books').to route_to(controller: 'books', action: 'create') }
  specify { expect(patch: '/books/1').to route_to(controller: 'books', action: 'update', id: '1') }
  specify do
    expect(delete: '/books/1').to route_to(controller: 'books', action: 'destroy', id: '1')
  end

  describe 'GET #index' do
    subject { get :index }

    specify { expect(subject).to render_template('books/index') }
  end

  describe 'GET #show' do
    let(:book) { create :book }

    subject { get :show, params: { id: book } }

    specify { expect(subject).to render_template('books/show') }
  end

  describe 'GET #new' do
    subject { get :new }

    specify { expect(subject).to render_template('books/new') }
  end

  describe 'GET #edit' do
    let(:book) { create :book }

    subject { get :edit, params: { id: book } }

    specify { expect(subject).to render_template('books/edit') }
  end

  describe 'POST #create' do
    let(:form_params) do
      {
        title: "Чужак",
        author: "Фрай",
        publisher: Book::PUBLISHERS.first,
        preview: Faker::LordOfTheRings.quote,
        description: Faker::Lorem.paragraph,
        year: 2000
      }
    end
    let(:params) { { book: form_params } }

    subject { post :create, params: params }

    specify { expect { subject }.to change(Book, :count).by(1) }
    specify { expect(subject).to redirect_to book_path(Book.last) }

    context 'with invalid params' do
      let(:form_params) { { title: "Wow"} }

      specify { expect(subject).to render_template(:new) }
    end
  end

  describe 'PATCH #update' do
    let(:book) { create :book }
    let(:title) { "Чужак" }
    let(:author) { "Фрай" }
    let(:publisher) { Book::PUBLISHERS[Book::PUBLISHERS.index(book.publisher) - 1] }
    let(:preview) { "Лонли-Локли, а не Лонки-Ломки!" }
    let(:description) { "Книга о чужаке" }
    let(:year) { book.year == 2000 ? 2001 : 2000 }

    let(:form_params) do
      {
        title: title,
        author: author,
        publisher: publisher,
        preview: preview,
        description: description,
        year: year
      }
    end
    let(:params) { { book: form_params } }

    subject { patch :update, params: params.merge(id: book) }

    it 'updates book title' do
      expect { subject }.to change { book.reload.title }.to(title)
    end

    it 'updates book author' do
      expect { subject }.to change { book.reload.author }.to(author)
    end

    it 'updates book publisher' do
      expect { subject }.to change { book.reload.publisher }.to(publisher)
    end

    it 'updates book preview' do
      expect { subject }.to change { book.reload.preview }.to(preview)
    end

    it 'updates book description' do
      expect { subject }.to change { book.reload.description }.to(description)
    end

    it 'updates book year' do
      expect { subject }.to change { book.reload.year }.to(year)
    end

    it "redirects to show" do
      expect(subject).to redirect_to book_path(book)
    end

    context 'invalid params' do
      let(:publisher) { Faker::Book.publisher }

      specify { expect(subject).to render_template("books/edit") }
    end
  end

  describe 'DELETE #destroy' do
    let!(:book) { create :book }

    subject { delete :destroy, params: { id: book } }

    specify { expect { subject }.to change(Book, :count).by(-1) }
  end
end
