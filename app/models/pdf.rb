class Pdf < ApplicationRecord
  has_one_attached :pdf_attachment

  after_destroy :purge_attachment

  def purge_attachment
    self.pdf_attachment.purge
  end

end
