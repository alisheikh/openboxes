<div class="summary">
	<table id="shipmentSummary" border="0">
		<tbody>			
			<tr>
				<td style="width: 1%" class="middle center">
					<g:if test="${shipmentInstance?.shipmentType }">
						<img src="${createLinkTo(dir:'images/icons/shipmentType',file: 'ShipmentType' + format.metadata(obj:shipmentInstance?.shipmentType, locale:null) + '.png')}"
							alt="${format.metadata(obj:shipmentInstance?.shipmentType)}" style="vertical-align: middle; width: 24px; height: 24px;" />					
					</g:if>
					<g:else>
						<img src="${createLinkTo(dir:'images/icons/silk',file: 'lorry.png')}"
							alt="${format.metadata(obj:shipmentInstance?.shipmentType)}" style="vertical-align: middle;" />					
					</g:else>
				</td>
                <td width="1%">
                    <div>
                        <g:render template="../shipment/actions" />
                    </div>
                </td>
				<td class="middle">

					<g:if test="${!shipmentInstance.id}">
						<div class="title">
							New Shipment
						</div>
					</g:if>

					<div class="title">
						${shipmentInstance?.shipmentNumber}
						<g:link controller="shipment" action="showDetails" id="${shipmentInstance?.id }">
							${shipmentInstance?.name}
						</g:link>
					</div>
				
					<div>
						<g:if test="${shipmentInstance?.shipmentType }">
							<span class="shipmentType">
								<warehouse:message code="shipping.shipmentType.label"/>:						
								<label>${format.metadata(obj:shipmentInstance?.shipmentType)}</label> 
							</span>
						</g:if>
						<g:if test="${shipmentInstance?.origin }">
							<span class="origin">
								<warehouse:message code="shipping.origin.label"/>:
								<label>${format.metadata(obj:shipmentInstance?.origin)}</label>
							</span>
						</g:if>
						<g:if test="${shipmentInstance?.destination }">
							<span class="destination">
								<warehouse:message code="shipping.destination.label"/>:
								<label>${format.metadata(obj:shipmentInstance?.destination)}</label>
							</span>
						</g:if>
					</div>
					<div>
						<%--
						<g:if test="${shipmentInstance?.status?.code }">
							<span class="shipment-status">
								<warehouse:message code="shipping.status.label"/>:
								<label class="status"><format:metadata obj="${shipmentInstance?.status?.code}"/></label>
							</span>
						</g:if>
						--%>
						<g:if test="${!shipmentInstance?.hasShipped() }">
							<g:if test="${shipmentInstance?.expectedShippingDate }">
								<span class="expectedShippingDate">
									<warehouse:message code="shipping.expectedShippingDate.label"/>:						
									<label><format:date obj="${shipmentInstance?.expectedShippingDate}"/></label> 
								</span>
							</g:if>
						</g:if>
						<g:else>
							<span class="actualShippingDate">
								<warehouse:message code="shipping.actualShippingDate.label"/>:						
								<label><format:date obj="${shipmentInstance?.actualShippingDate}"/></label> 
							</span>
						</g:else>
						<g:if test="${!shipmentInstance?.wasReceived() }">
							<g:if test="${shipmentInstance?.expectedDeliveryDate }">
								<span class="expectedDeliveryDate">
									<warehouse:message code="shipping.expectedDeliveryDate.label"/>:						
									<label>
										<format:date obj="${shipmentInstance?.expectedDeliveryDate}"/>
									</label> 
								</span>
							</g:if>
						</g:if>
						<g:else>
							<span class="actualDeliveryDate">
								<warehouse:message code="shipping.actualDeliveryDate.label"/>:						
								<label><format:date obj="${shipmentInstance?.actualDeliveryDate}"/></label> 
							</span>
						</g:else>

						<g:if test="${shipmentInstance?.shipmentItems}">
							<span>
								<warehouse:message code="shipment.numItems.label"/>:
								<label>${shipmentInstance?.shipmentItems?.size()?:0 }</label>
							</span>
						</g:if>

						<g:if test="${shipmentInstance?.totalWeightInPounds()}">
							<span>
								<warehouse:message code="shipping.totalWeight.label"/>:
								<label>
									<g:formatNumber format="#,##0.00" number="${shipmentInstance?.totalWeightInPounds() ?: 0.00 }" /> <warehouse:message code="default.lbs.label"/>
								</label>
							</span>
						</g:if>

					</div>

				</td>

				<td class="right" width="1%">
					<div class="tag tag-alert">
						${shipmentInstance?.status?.name}
					</div>
				</td>
				
			</tr>
		</tbody>
	</table>
</div>
