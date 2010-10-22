  
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
         <meta name="layout" content="custom" />
         <title>Enter Shipment Details</title>         
    </head>
    <body>
        <div class="body">
           <g:if test="${flash.message}">
                 <div class="message">${flash.message}</div>
           </g:if>   
			<g:hasErrors bean="${shipmentInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${shipmentInstance}" as="list" />
	            </div>				
			</g:hasErrors>
           <g:form action="suitcase" method="post">
	           <g:hiddenField name="id" value="${shipmentInstance?.id}"/>
               <div class="dialog">
                <table>
                    <tbody>
						<tr class="prop">
							<td valign="top" class="name"><label>Type</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: shipmentInstance, field: 'shipmentType', 'errors')}">
								<g:if test="${shipmentInstance?.shipmentType}">
									<g:hiddenField name="shipmentType.id" value="${shipmentInstance?.shipmentType?.id}" />
									${shipmentInstance?.shipmentType?.name }																	
								</g:if>
								<g:else>
									<g:select
										name="shipmentType.id"
										from="${org.pih.warehouse.shipping.ShipmentType.list()}"
										optionKey="id" optionValue="name" value="${shipmentInstance?.shipmentType?.id}" />								
								</g:else>
							</td>
						</tr>
						<tr class='prop'>
							<td valign='top' class='name'>
								<label for='name'>Name:</label>
							</td>
							<td valign='top' class='value ${hasErrors(bean:shipmentInstance,field:'name','errors')}'>
								<input type="text" name='name' value="${shipmentInstance?.name?.encodeAsHTML()}" size="40"/>
							</td>
						</tr>  
						<tr class="prop">
							<td valign="top" class="name"><label>Route</label></td>
							<td valign="top"
								class="value ">
								
								<table border="0" style="border: 1px solid whitesmoke; background-color: #f5f5f5;">
									<thead>
										<tr>
											<th style="text-align: center">Departing</th>
											<th style="text-align: center">Arriving</th>
									
									</thead>
									<tbody>
										<tr>
											<td class="value ${hasErrors(bean: shipmentInstance, field: 'origin', 'errors')}"
												style="text-align: center">
												<g:select name="origin.id" from="${org.pih.warehouse.inventory.Warehouse.list()}" optionKey="id" value="${shipmentInstance?.origin?.id}" style="width: 180px" />							
											</td>
											<td class="value ${hasErrors(bean: shipmentInstance, field: 'destination', 'errors')}"
												style="text-align: center">
												<g:select name="destination.id" from="${org.pih.warehouse.inventory.Warehouse.list()}" optionKey="id" value="${shipmentInstance?.destination?.id}" style="width: 180px" />							
											</td>
										</tr>
										<tr>
											<td nowrap class="value" style="text-align: center;"> 
												<g:jqueryDatePicker id="expectedShippingDate" name="expectedShippingDate"
													value="${shipmentInstance?.expectedShippingDate}" format="MM/dd/yyyy"/>							
											
											</td>
											<td nowrap class="value" style="text-align: center;"> 
												<g:jqueryDatePicker id="expectedDeliveryDate" name="expectedDeliveryDate"
													value="${shipmentInstance?.expectedDeliveryDate}" format="MM/dd/yyyy"/>
											</td>
											
										</tr>
									</tbody>
								</table>
							</td>
						</tr>						
						<tr>
							<td>
							
							</td>
							<td>
								<div class="buttons">
									<span class="formButton"> 
										<g:submitButton name="submit" value="Next"></g:submitButton> 
									</span>
								</div>
							</td>
						</tr>			
						
						
                    </tbody>
               </table>
               </div>
            </g:form>
        </div>
    </body>
</html>