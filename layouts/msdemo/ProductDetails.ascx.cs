using System;
using System.Collections.Generic;
using System.Linq;
using ms8.code.Search;
using Sitecore.Data.Fields;
using Sitecore.Data.Items;

namespace ms8.layouts.msdemo
{
    public partial class ProductDetails : System.Web.UI.UserControl
    {


        private Guid Parse(string value)
        {
            try
            {
                return Guid.Parse(value);
            }
            catch 
            {
                return Guid.Empty;
            }
        }

        public string Isbn
        {
            get { return Sitecore.Context.Item.Fields["ISBN"].Value; }
        }
    }
}