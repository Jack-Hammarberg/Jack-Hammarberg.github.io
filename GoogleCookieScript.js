// make sure to use your own GTM measurement id in the line below
<script async src="https://www.googletagmanager.com/gtag/js?id=GTM-paste_your_gtm measurement_id_here"></script>
 
<script>

 window.dataLayer = window.dataLayer || [];

 function gtag(){dataLayer.push(arguments);}

 gtag('consent', 'default', {
   
  'analytics_storage': 'denied',

  'ad_storage': 'denied',

  'ad_user_data': 'denied',

  'ad_personalization': 'denied',
   
  'personalization_storage': 'denied',
   
  'functionality_storage': 'granted',
   
  'security_storage': 'granted'

 });

 gtag('js', new Date());



 let squarespaceCookies = {};

 if (window.getSquarespaceCookies) {

   squarespaceCookies = window.getSquarespaceCookies();

 }

 const consentValue = squarespaceCookies.marketing === 'accepted' ? 'granted' :  'denied';

 const consentObj = { 
   
  'analytics_storage': consentValue,

  'ad_storage': consentValue,

  'ad_user_data': consentValue,

  'ad_personalization': consentValue,
   
  'personalization_storage': consentValue,
   
  'functionality_storage': consentValue,

  'security_storage': consentValue



 };

 gtag('consent', 'update', consentObj);

 

 window.onCookieBannerInteraction = () => {

   let squarespaceCookies = {};

   if (window.getSquarespaceCookies) {

     squarespaceCookies = window.getSquarespaceCookies();

   }

   const consentValue = squarespaceCookies.marketing === 'accepted' ? 'granted' :  'denied';
  const consentObj = { 

     'analytics_storage': consentValue,
    
     'ad_storage': consentValue,

     'ad_user_data': consentValue,

     'ad_personalization': consentValue,
    
     'personalization_storage': consentValue,
    
     'functionality_storage': consentValue,

     'security_storage': consentValue



   };

   gtag('consent', 'update', consentObj);

 }

</script>
