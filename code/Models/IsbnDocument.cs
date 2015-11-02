using System;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace ms8.code.Models
{
    [BsonIgnoreExtraElements]
    internal class IsbnDocument
    {
        [BsonElement("IsbnNumber")]
        public string Isbn { get; set; }
        [BsonId]
        public ObjectId Id { get; set; }

        [BsonElement("Content")]
        public IsbnContent Content { get; set; }
    }

    [BsonIgnoreExtraElements]
    internal class IsbnContent
    {
        [BsonElement("return")]
        public IsbnReturn Return { get; set; }
    }

    [BsonIgnoreExtraElements]
    internal class IsbnReturn
    {
        [BsonElement("toc")]
        public string TableOfContent { get; set; }

        [BsonElement("description")]
        public string Description { get; set; }


        [BsonElement("actualPublicationDate")]
        public DateTime PublicationDate { get; set; }

        [BsonElement("metatags")]
        public string MetaTags { get; set; }

        [BsonElement("name")]
        public string Name { get; set; }

        [BsonElement("shortTitle")]
        public string Subtitle { get; set; }

        [BsonElement("categories")]
        public IsbnCategory[] Categories { get; set; }

        [BsonElement("subjectGroup")]
        public IsbnSubject SubjectGroup { get; set; }

        [BsonElement("series")]
        public IsbnSeries Series { get; set; }


        [BsonElement("publisher")]
        public IsbnPublisher Publisher { get; set; }

        [BsonElement("editionNumber")]
        public string EditionNumber { get; set; }

        [BsonElement("binding")]
        public IsbnBinding Binding { get; set; }

        [BsonElement("pageNum")]
        public string Pages { get; set; }
    }

    [BsonIgnoreExtraElements]
    internal class IsbnBinding
    {
        [BsonElement("text")]
        public string Text { get; set; }
    }

    [BsonIgnoreExtraElements]
    internal class IsbnSubject
    {
        [BsonElement("description")]
        public string Description { get; set; }
    }

    [BsonIgnoreExtraElements]
    internal class IsbnPublisher
    {
        [BsonElement("description")]
        public string Description { get; set; }
    }

    [BsonIgnoreExtraElements]
    internal class IsbnSeries
    {
        [BsonElement("description")]
        public string Description { get; set; }
    }

    [BsonIgnoreExtraElements]
    internal class IsbnCategory
    {
        [BsonElement("title")]
        public string Title { get; set; }
    }
}