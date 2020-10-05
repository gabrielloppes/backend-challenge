class Transaction < ApplicationRecord
  # Validates if the kind is IN or OUT
  validates :kind,
  # Validates the operation description
  :kind_description,
  # Validates the time of the transaction
  :processed_at,
  # Validates the amount of the the transaction
  :amount,
  # Validates the document, in this case the CPF
  :document,
  # The card should exist
  :card, presence: true
  
  belongs_to :store
  belongs_to :importer
  
  # Updates the store balance only when creating an object
  after_create :update_balance
  
  # Hash that contains inputs and outputs and the description for each of them
  KINDS = {
    "1": {kind: "input", description: "Débito"},
    "2": {kind: "output", description: "Boleto"},
    "3": {kind: "output", description: "Financiamento"},
    "4": {kind: "input", description: "Crédito"},
    "5": {kind: "input", description: "Recebimento Empréstimo"},
    "6": {kind: "input", description: "Vendas"},
    "7": {kind: "input", description: "Recebimento TED"},
    "8": {kind: "input", description: "Recebimento DOC"},
    "9": {kind: "output", description: "Aluguel"},
  }.freeze # Used .freeze because this hash won't change, it's a const object

  # Checks the kind of text
  def kind_text
    if self.is_input?
      return "Entrada"
    else
      return "Saída"
    end
  end

  # Handles the kind
  def is_input
    self.kind == "input"
  end

  def is_output
    self.kind == "output"
  end

  # Handles the balance updates
  def update_balance
    if self.is_input?
      balance = self.store.balance + self.amount
    else
      balance = self.store.balance - self.amount
    end
    self.store.update(balance: balance)
  end

end
