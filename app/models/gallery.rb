# class Gallery < ApplicationRecord
#     #It is weired that I need to block the line below to make the function work.
#     belongs_to :general_info, optional: true
#     has_many :reviews
#     has_many :images, dependent: :destroy
#     validates_presence_of :gallery_title
#     validates_presence_of :gallery_description
#     validates_presence_of :gallery_picture
#     validates_presence_of :GeneralInfo_id
#     mount_uploaders :gallery_picture, GalleryUploader
#     mount_uploaders :test_picture, GalleryUploader

#     # def gallery_picture=(documents)
#     #     docs_to_append = documents.map do |doc|
#     #       uploader = GalleryUploader.new(self)
#     #       uploader.store! doc
#     #       uploader
#     #     end
#     #     self[:gallery_picture] ||= []
#     #     self[:gallery_picture] += docs_to_append.map {|uploader| uploader.file.filename}
#     # end
    
# end


class Gallery < ApplicationRecord
    #It is weired that I need to block the line below to make the function work.
        belongs_to :general_info, optional: true
        has_many :reviews
    
        # NXTFolio : Added in Spring 2023 for tagging feature.
        #has_many :gallery_taggings, dependent: :destroy
        has_many :tagged_users, through: :gallery_taggings, source: :general_info
    
        validates_presence_of :gallery_title
        validates_presence_of :gallery_description
        validates_presence_of :gallery_picture
        validates_presence_of :GeneralInfo_id
    
        mount_uploaders :gallery_picture, GalleryUploader

        mount_uploaders :test_picture, GalleryUploader

    # def gallery_picture=(documents)
    #     docs_to_append = documents.map do |doc|
    #       uploader = GalleryUploader.new(self)
    #       uploader.store! doc
    #       uploader
    #     end
    #     self[:gallery_picture] ||= []
    #     self[:gallery_picture] += docs_to_append.map {|uploader| uploader.file.filename}
    # end


end
    