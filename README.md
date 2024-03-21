API TESTED WITH LOCALHOST AND POSTMAN USING DATA FROM CSV USED AS DB AND CREATED USING RAILS 7.1.3.2
BELOW ARE THE ANSWERS REQUIRED IN THE TEST.
THESE REQUESTS HAVE BEEN FULLFILED:
- Reject transaction if user is trying too many transactions in a row;
- Reject transactions above a certain amount in a given period;
- Reject transaction if a user had a chargeback before (note that this information does not comes on the payload. The chargeback data is received days after the transaction was approved)

2.1 Understand the Industry

Q: Briefly explain the flow of money, information, and the roles of the main players in the payment industry.

A: Money flow refers to the natural exchange of values during transactions between individuals or businesses in exchange for goods or services. Typically, it flows from a buyer to a seller, sometimes with an intermediary between them. The flow can occur through various payment methods such as cash, credit and debit cards, bank transfers, digital wallets, and cryptocurrencies.

Q: Explain the main differences between acquirer, sub-acquirer, and payment gateway, and how the flow explained in the previous question changes for these players.

A:
Acquirer: Acquirers are banks or financial institutions that maintain relationships with sellers of products or services, enabling them to accept payments via cards. They are also responsible for processing transactions on behalf of sellers, handling authorization requests, and providing support for refunds and disputes. Acquirers often have direct contact with credit card companies, facilitating transaction processing and fund flow between sellers and buyers.

Sub-acquirer: Sub-acquirers act as intermediaries in the payment process between sellers and buyers. The services offered by sub-acquirers are similar to those of acquirers but are primarily aimed at sellers who cannot access acquirer services due to some impediment. Sub-acquirers can aggregate multiple transactions from various sellers under their own commercial accounts, allowing access for sellers who do not have the financial activity to use a common acquirer.

Payment Gateway: Essentially, a conduit through which transaction data between parties is passed to the acquirer. It can be a technological platform or service provider and does not handle the transacted values, merely transmitting encrypted data for the acquirer's interpretation. Payment gateways can also provide fraud prevention services, token validation systems, recurring billing, and integration with other payment methods.

These mentioned players play a crucial role in the financial landscape of our society. With increasing digitization of currency and decreasing use of cash, sellers and buyers rely on the convenience, security, and ease of services provided by acquirers, sub-acquirers, and payment gateways. While the former two are directly involved in processing transactions and handling funds, the latter is dedicated to ensuring the security of data transmission between the seller and the payment processor.

Q: Explain what chargebacks are, how they differ from cancellations, and their connection with fraud in the acquiring world.

A: Chargebacks occur when a buyer requests a reversal of a transaction due to various reasons such as fraud, unauthorized transactions, defective products, or services not meeting quality standards. Chargebacks are often associated with fraudulent transactions or service/product failures, serving as a warning sign to reconsider risk prevention algorithms or measures to mitigate potential damages. In cases of fraud or identity theft-related chargebacks, the seller bears financial loss as the product or service was delivered and the payment refunded. Cardholders may also suffer if their data is used without authorization. Thus, it's essential to utilize all possible tools to protect the involved parties or at least minimize their losses.

Cancellations, on the other hand, occur when a transaction is not completed, typically initiated by either the seller or the buyer. Unlike chargebacks, cancellations do not involve disputes and often happen when the customer decides to cancel the order shortly after placing it, before the goods or services are delivered or the transaction is fully processed.

2.2. Solve the Problem

Q:A client sends you an email asking for a chargeback status. You check the system, and see that we have received his defense documents and sent them to the issuer, but the issuer has not accepted our defense. They claim that the cardholder continued to affirm that she did not receive the product, and our documents were not sufficient to prove otherwise. You respond to our client informing that the issuer denied the defense, and the next day he emails you back, extremely angry and disappointed, claiming the product was delivered and thatthis chargeback is not right.
Considering that the chargeback reason is “Product/Service not provided”, what would you do in
this situation?

A:Aware that this is a complex situation involving finances and potential customer losses, the ideal approach would be to calmly explain that banks or financial institutions are responsible for authorizing or reversing payments, and that the company is solely responsible for transmitting the data sent. As this is a problem arising from claims of non-delivery of service/product, it's advisable to advise the customer on the importance of providing documentary evidence for such procedures. If the customer has evidence of delivery, they should be encouraged to provide it. To retain the customer, it could also be mentioned that an analysis of past transaction patterns of the chargeback requester will be conducted to determine if there is a history of such claims, enabling the implementation of security measures to prevent such behavior.

3. Hands Dirty

Q: Attached herein lies a spreadsheet with hypothetical transactional data. Imagine that you are trying to understand if there is any kind of suspicious behavior.
Analyze the data provided and present your conclusions (consider that all transactions are made using a mobile device). In addition to the spreadsheet data, what other data would you look at to try to find patterns of possible frauds?


A: Some points of attention need to be observed:
- Some transactions did not have the device_id registered for some reason.
- Some transactions had significant amounts at late-night hours.
- Some transactions were made consecutively within a short time frame.
- Some transactions were made consecutively at the same commercial establishment.
- Transactions carried out by users who already had a chargeback classified as fraudulent.

These points are important for risk analysis because they indicate behavior that deviates from typical transactions. Transactions conducted late at night warrant extra attention since the possibility of someone using the card while the owner is asleep is relatively high. Sequential purchases at the same establishment are not typical and therefore deserve more scrutiny. Transactions without a registered device_id are problematic as they hinder transaction traceability through the registered device.

Blocking transactions made by users who have already requested a chargeback classified as fraudulent is the logical step to avoid potential financial losses.

Data can be enhanced to provide a more personalized experience for the customer profile. For example, identifying through geolocation where the customer's purchases are concentrated. Their spending profile can also be considered by measuring their monthly expenses based on the average of transactions conducted over the months.

As mentioned in the previous response, I believe an evaluation of the customer's financial profile and transactions could yield good results in terms of preventing potential frauds or chargebacks. Implementing a preventive rule that prevents overburdening the customer based on their own spending could even be highlighted as a distinctive feature for the company, as few companies offer this level of customization.

