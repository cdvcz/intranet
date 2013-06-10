# encoding: utf-8
# author: mbach

require('spec_helper')

describe(ContractsController) do

  CONTRACT1CREATE =
  {
            status: 1,
            number: 'S1',
           subject: 'Smlouva 1 Create',
          tax_year: 2013,
       description: 'Smlouva se uzavírá...',
     deadline_date: '2013-06-11',
          end_date: '2013-06-30',
         archiving: 'MZK',
         role_type: 'customer',
        price_type: 'more',
    invoicing_note: 'Poznámka k fakturování',
              note: 'Poznámka'
  }

  CONTRACT1UPDATE1 =
  {
            status: 1,
            number: 'S1',
           subject: 'Smlouva 1 Update 1',
          tax_year: 2013,
       description: 'Smlouva se uzavírá...',
     deadline_date: '2013-06-11',
          end_date: '2013-06-30',
         archiving: 'MZK',
         role_type: 'customer',
        price_type: 'more',
    invoicing_note: 'Poznámka k fakturování',
              note: 'Poznámka'
  }

  CONTRACT1UPDATE2 =
  {
            status: 1,
            number: 'S1',
           subject: nil,
          tax_year: 2013,
       description: 'Smlouva se uzavírá...',
     deadline_date: '2013-06-11',
          end_date: '2013-06-30',
         archiving: 'MZK',
         role_type: 'customer',
        price_type: 'more',
    invoicing_note: 'Poznámka k fakturování',
              note: 'Poznámka'
  }

  CONTRACT2CREATE =
  {
            status: 1,
            number: 'S2',
           subject: 'Smlouva 2 Create',
          tax_year: 2013,
       description: 'Smlouva se uzavírá...',
     deadline_date: '2013-06-11',
          end_date: '2013-06-30',
         archiving: 'MZK',
         role_type: 'customer',
        price_type: 'more',
    invoicing_note: 'Poznámka k fakturování',
              note: 'Poznámka'
  }

  CONTRACT3CREATE =
  {
            status: 1,
            number: 'S3',
           subject: 'Smlouva 3 Create',
          tax_year: 2013,
       description: 'Smlouva se uzavírá...',
     deadline_date: '2013-06-11',
          end_date: '2013-06-30',
         archiving: 'MZK',
         role_type: 'customer',
        price_type: 'more',
    invoicing_note: 'Poznámka k fakturování',
              note: 'Poznámka'
  }

  CONTRACT4CREATE =
  {
            status: 1,
            number: 'S4',
           subject: nil,
          tax_year: 2013,
       description: 'Smlouva se uzavírá...',
     deadline_date: '2013-06-11',
          end_date: '2013-06-30',
         archiving: 'MZK',
         role_type: 'customer',
        price_type: 'more',
    invoicing_note: 'Poznámka k fakturování',
              note: 'Poznámka'
  }

  CONTRACT5CREATE =
  {
            status: 1,
            number: 'S5',
           subject: 'Smlouva 5 Create',
          tax_year: 2013,
       description: 'Smlouva se uzavírá...',
     deadline_date: '2013-06-11',
          end_date: '2013-06-30',
         archiving: 'MZK',
         role_type: nil,
        price_type: 'more',
    invoicing_note: 'Poznámka k fakturování',
              note: 'Poznámka'
  }

  CONTRACT6CREATE =
  {
            status: 1,
            number: 'S6',
           subject: 'Smlouva 6 Create',
          tax_year: 2013,
       description: 'Smlouva se uzavírá...',
     deadline_date: '2013-06-11',
          end_date: '2013-06-30',
         archiving: 'MZK',
         role_type: 'apple',
        price_type: 'more',
    invoicing_note: 'Poznámka k fakturování',
              note: 'Poznámka'
  }

  CONTRACT7CREATE =
  {
            status: 1,
            number: 'S7',
           subject: 'Smlouva 7 Create',
          tax_year: 2013,
       description: 'Smlouva se uzavírá...',
     deadline_date: '2013-06-11',
          end_date: '2013-06-30',
         archiving: 'MZK',
         role_type: 'customer',
        price_type: nil,
    invoicing_note: 'Poznámka k fakturování',
              note: 'Poznámka'
  }

  CONTRACT8CREATE =
  {
            status: 1,
            number: 'S8',
           subject: 'Smlouva 8 Create',
          tax_year: 2013,
       description: 'Smlouva se uzavírá...',
     deadline_date: '2013-06-11',
          end_date: '2013-06-30',
         archiving: 'MZK',
         role_type: 'customer',
        price_type: 'banana',
    invoicing_note: 'Poznámka k fakturování',
              note: 'Poznámka'
  }

  CONTRACT9CREATE =
  {
            status: 1,
            number: nil,
           subject: 'Smlouva 9 Create',
          tax_year: 2013,
       description: 'Smlouva se uzavírá...',
     deadline_date: '2013-06-11',
          end_date: '2013-06-30',
         archiving: 'MZK',
         role_type: 'customer',
        price_type: 'more',
    invoicing_note: 'Poznámka k fakturování',
              note: 'Poznámka'
  }

  CONTRACT10CREATE =
  {
            status: 1,
            number: 'S10',
           subject: 'Smlouva 10 Create',
          tax_year: 2013,
       description: nil,
     deadline_date: '2013-06-11',
          end_date: '2013-06-30',
         archiving: 'MZK',
         role_type: 'customer',
        price_type: 'more',
    invoicing_note: 'Poznámka k fakturování',
              note: 'Poznámka'
  }

  CONTRACT11CREATE =
  {
            status: 1,
            number: 'S11',
           subject: 'Smlouva 11 Create',
          tax_year: nil,
       description: 'Smlouva se uzavírá...',
     deadline_date: '2013-06-11',
          end_date: '2013-06-30',
         archiving: 'MZK',
         role_type: 'customer',
        price_type: 'more',
    invoicing_note: 'Poznámka k fakturování',
              note: 'Poznámka'
  }

  CONTRACT12CREATE =
  {
            status: nil,
            number: 'S12',
           subject: 'Smlouva 12 Create',
          tax_year: 2013,
       description: 'Smlouva se uzavírá...',
     deadline_date: '2013-06-11',
          end_date: '2013-06-30',
         archiving: 'MZK',
         role_type: 'customer',
        price_type: 'more',
    invoicing_note: 'Poznámka k fakturování',
              note: 'Poznámka'
  }

  CONTRACT13CREATE =
  {
            status: 1,
            number: 'S13',
           subject: 'Smlouva 13 Create',
          tax_year: 2013,
       description: 'Smlouva se uzavírá...',
     deadline_date: nil,
          end_date: '2013-06-30',
         archiving: 'MZK',
         role_type: 'customer',
        price_type: 'more',
    invoicing_note: 'Poznámka k fakturování',
              note: 'Poznámka'
  }

  CONTRACT14CREATE =
  {
            status: 1,
            number: 'S14',
           subject: 'Smlouva 14 Create',
          tax_year: 2013,
       description: 'Smlouva se uzavírá...',
     deadline_date: '2013-06-11',
          end_date: '2013-06-30',
         archiving: nil,
         role_type: 'customer',
        price_type: 'more',
    invoicing_note: 'Poznámka k fakturování',
              note: 'Poznámka'
  }

  before() do
    setup_user(:admin)
    @contract1 = FactoryGirl.create(:contract,CONTRACT1CREATE)
    @contract2 = FactoryGirl.create(:contract,CONTRACT2CREATE)
  end

  # index #

  it('vrátí seznam smluv') do
    get(:index,{format: :json})

    response().status().should() == 200
    body = ActiveSupport::JSON.decode(response().body())

    body['content'].count().should() == 2

    body['meta']['total_pages'].should() == 1
    body['meta']['total_entries'].should() == 2

    ['id','subject','description'].each() do |attribute|
      body['content'][0][attribute].should() == @contract1.attributes()[attribute]
      body['content'][1][attribute].should() == @contract2.attributes()[attribute]
    end
  end

  # show #

  it('vrátí detail smlouvy') do
    get(:show,{id: @contract1.id,format: :json})

    response().status().should() == 200
    body = ActiveSupport::JSON.decode(response().body())

    ['id','subject','description'].each() do |attribute|
      body['content'][attribute].should() == @contract1.attributes()[attribute]
    end
  end

  # create #

  it('vytvoří smlouvu') do
    post(:create,{format: :json,contract: CONTRACT3CREATE})

    response().status().should() == 200
    body = ActiveSupport::JSON.decode(response().body())

    body['content']['id'].should() == Contract.last().id()
  end

  it('nevytvoří smlouvu bez věci') do
    post(:create,{format: :json,contract: CONTRACT4CREATE})

    response().status().should() == 422
    body = ActiveSupport::JSON.decode(response().body())

    body['errors'].count().should() == 1
    body['errors']['subject'].should(include('Toto pole nemůže zůstat prázdné'))
  end

  it('nevytvoří smlouvu bez role') do
    post(:create,{format: :json,contract: CONTRACT5CREATE})

    response().status().should() == 422
    body = ActiveSupport::JSON.decode(response().body())

    body['errors'].count().should() == 1
    body['errors']['role_type'].should(include('Toto pole nemůže zůstat prázdné'))
  end

  it('nevytvoří smlouvu s chybnou rolí') do
    post(:create,{format: :json,contract: CONTRACT6CREATE})

    response().status().should() == 422
    body = ActiveSupport::JSON.decode(response().body())

    body['errors'].count().should() == 1
    body['errors']['role_type'].should(include('Toto pole nemůže nabývat hodnot jiných než hodnot číselníku'))
  end

  it('nevytvoří smlouvu bez částky') do
    post(:create,{format: :json,contract: CONTRACT7CREATE})

    response().status().should() == 422
    body = ActiveSupport::JSON.decode(response().body())

    body['errors'].count().should() == 1
    body['errors']['price_type'].should(include('Toto pole nemůže zůstat prázdné'))
  end

  it('nevytvoří smlouvu s chybnou částkou') do
    post(:create,{format: :json,contract: CONTRACT8CREATE})

    response().status().should() == 422
    body = ActiveSupport::JSON.decode(response().body())

    body['errors'].count().should() == 1
    body['errors']['price_type'].should(include('Toto pole nemůže nabývat hodnot jiných než hodnot číselníku'))
  end

  it('nevytvoří smlouvu bez čísla') do
    post(:create,{format: :json,contract: CONTRACT9CREATE})

    response().status().should() == 422
    body = ActiveSupport::JSON.decode(response().body())

    body['errors'].count().should() == 1
    body['errors']['number'].should(include('Toto pole nemůže zůstat prázdné'))
  end

  it('nevytvoří smlouvu bez popisu') do
    post(:create,{format: :json,contract: CONTRACT10CREATE})

    response().status().should() == 422
    body = ActiveSupport::JSON.decode(response().body())

    body['errors'].count().should() == 1
    body['errors']['description'].should(include('Toto pole nemůže zůstat prázdné'))
  end

  it('nevytvoří smlouvu bez roku') do
    post(:create,{format: :json,contract: CONTRACT11CREATE})

    response().status().should() == 422
    body = ActiveSupport::JSON.decode(response().body())

    body['errors'].count().should() == 1
    body['errors']['tax_year'].should(include('Toto pole nemůže zůstat prázdné'))
  end

  it('nevytvoří smlouvu bez stavu') do
    post(:create,{format: :json,contract: CONTRACT12CREATE})

    response().status().should() == 422
    body = ActiveSupport::JSON.decode(response().body())

    body['errors'].count().should() == 1
    body['errors']['status'].should(include('Toto pole nemůže zůstat prázdné'))
  end

  it('nevytvoří smlouvu bez termínu') do
    post(:create,{format: :json,contract: CONTRACT13CREATE})

    response().status().should() == 422
    body = ActiveSupport::JSON.decode(response().body())

    body['errors'].count().should() == 1
    body['errors']['deadline_date'].should(include('Toto pole nemůže zůstat prázdné'))
  end

  it('nevytvoří smlouvu bez archivování') do
    post(:create,{format: :json,contract: CONTRACT14CREATE})

    response().status().should() == 422
    body = ActiveSupport::JSON.decode(response().body())

    body['errors'].count().should() == 1
    body['errors']['archiving'].should(include('Toto pole nemůže zůstat prázdné'))
  end

  # update #

  it('aktualizuje smlouvu') do
    put(:update,{format: :json,id: @contract1.id(),contract: CONTRACT1UPDATE1})

    response().status().should() == 204
  end

  it('neaktualizuje smlouvu bez věci') do
    put(:update,{format: :json,id: @contract1.id(),contract: CONTRACT1UPDATE2})

    response().status().should() == 422
    body = ActiveSupport::JSON.decode(response().body())

    body['errors'].count().should() == 1
    body['errors']['subject'].should(include('Toto pole nemůže zůstat prázdné'))
  end

  # destroy #

  it('odstraní smlouvu') do
    delete(:destroy,{format: :json,id: @contract1.id()})

    response().status().should() == 204
  end

end