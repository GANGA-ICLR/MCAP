namespace MCAPAPI.Models
{
    public class TradeAdd
    {
		public int Id { get; set; }
		public string Account { get; set; }
		public string AccountName { get; set; }
		public string Security { get; set; }
		public int Quantity { get; set; }
		public decimal Price { get; set; }
		public decimal TD_MarketValue { get; set; }
		public int TD_Quantity { get; set; }
		public string Dv0 { get; set; }
	}
}
