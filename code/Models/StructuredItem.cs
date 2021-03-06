﻿using System;

namespace ms8.code.Models
{
    public class StructuredItem : IFolder
    {
        public StructuredItem()
        {
            IsFolder = false;
            Depth = 0;
        }

        public string Id { get; set; }

        public bool IsFolder { get; set; }

        public int Depth { get; set; }

        public string ParentId => (Depth == 0) ? null : BuildFolder();

        private string BuildFolder()
        {
            if (!String.IsNullOrEmpty(Id) && Id.Length >= Depth)
            {
                return Id.Substring(0, Depth).ToLower();
            }

            return Id;
        }
    }
}