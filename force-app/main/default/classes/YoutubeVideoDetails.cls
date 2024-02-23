global class YoutubeVideoDetails {
    
    webservice static void details(String videoId, String recId){
        
       String enckey = You_tube_API_Setting__c.getInstance('Youtube API Key').Value__c;
        String endpt = You_tube_API_Setting__c.getInstance('Youtube Endpoints').Value__c;
        endpt = endpt.replace('[API_KEY]', enckey);
        endpt = endpt.replace('{VIDEO_ID}', videoId);
        System.debug(endpt);
       
        HttpRequest httpReq = new HttpRequest();
        Http http = new Http();
        HttpResponse httpRes = new HttpResponse();
        httpReq.setMethod('GET');
        httpReq.setEndPoint('https://api.publicapis.org/entries');
        httpRes = http.send(httpReq);
        System.debug(httpRes.getBody());
      /*
        JsonParser j = (JsonParser) JSON.deserialize(httpRes.getBody(), JsonParser.class);
        Youtube_Video_Detail__c yv = new Youtube_Video_Detail__c();
        yv.Id = recId;
        yv.Number_of_Likes__c = j.items[0].Statistics.viewCount;
        yv.Number_of_Comments__c = j.items[0].Statistics.commentCount;
        update yv;*/
        
    }
    
   public class JsonParser {
    public String kind;
	public String etag;
	public List<Items> items;
	public PageInfo pageInfo;
        }


	public class PageInfo {
		public Integer totalResults;
		public Integer resultsPerPage;
	}

	public class Items {
		public String kind;
		public String etag;
		public String id;
		public Statistics statistics;
	}

	public class Statistics {
		public String viewCount;
		public String likeCount;
		public String favoriteCount;
		public String commentCount;
	}


	
  
}