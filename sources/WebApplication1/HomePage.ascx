<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HomePage.ascx.cs" Inherits="WebApplication1.HomePage" %>


<style>
.icon {
	text-align: center;
}

.icon img {
	margin-bottom: 18px;
}

.icon .title {
	font: 24px/33px 'Open Sans', sans-serif;
	text-transform: uppercase;
	color: #626262;
	margin-bottom: 19px;
}

.page1 .icon {
	margin-bottom: 59px;
}
.grid_4,
.grid_12 {
  display: inline;
  float: left;
  margin-left: 10px;
  margin-right: 10px;
}
h2 {
    font-size: 35px;
    line-height: 40px;
    margin-bottom: 48px;
    padding-top: 24px;
    text-align: center;
}
h6 {
    font-size: 15px;
    text-align: center;
    font-style:normal;
    color: #626262
}
h1, h2, h3, h4, h5 {
    color: #BA1211;
    font-family: 'Open Sans',sans-serif;
    font-weight: normal;
    text-transform: uppercase;
}
</style>



<body>

    <table cellpadding="1px" cellspacing="20px">
        <thead> <h2>Welcome TO Process Configuration Framework</h2></thead>
        <tr >
        <td class="icon"> <a href='rtpMatrix.aspx'> <img src="imgs/icons/images/icon2.png" alt="RTP Matrix" title="RTP Matrix"></a>
        <div class="title">RTP Matrix</div>
<h6>Show All Technologies in RTP Matrix.</h6>
        </td> 
		
          
            <td class="icon"> <a href='BasicSearch.aspx'> <img src="imgs/icons/images/icon3.png" alt="Search Technology" title="Search Technology"> </a>
        <div class="title">Search</div>
                <h6>Search All Technologies by Abstraction and View Label.</h6>
            </td>
          
            <td class="icon"><a href='Technology.aspx?mode=Insert'><img src="imgs/icons/images/icon1.png" alt="Insert Technology" title="Insert Technology"></a>
        <div class="title">Insert</div>
                <h6>Insert Technology, Context and Impact.</h6>
            </td> </tr>
		
		<%--<tr>
		<td> <h6>Show All Technologies in RTP Matrix.</h6></td>
		<td>Search All Technologies by Abstraction and View Label.</td>
		<td>Insert Technology, Context and Impact.</td>
		</tr>--%>
         
    </table>




        

    </body>