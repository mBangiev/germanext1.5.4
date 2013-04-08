{*
* 2007-2012 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2012 PrestaShop SA
*  @version  Release: $Revision: 6594 $
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<script type="text/javascript">
// <![CDATA[
		
//]]>
</script>

<form action="{if isset($opc) && $opc}{$link->getPageLink('order-opc', true)}{else}{$link->getPageLink('order', true)}{/if}" method="post" class="submit">
	<div>
		<input type="hidden" value="{$order->id}" name="id_order"/>
		<p class="title_block">
			{if isset($GN_ALLOW_REORDER) && $GN_ALLOW_REORDER}
				<input type="submit" value="{l s='Reorder' mod='germanext'}" name="submitReorder" class="button exclusive" />
			{/if}
			{l s='Order' mod='germanext'} <span class="color-myaccount">{l s='#' mod='germanext'}{$order->id|string_format:"%06d"}</span> - {l s='placed on' mod='germanext'} {dateFormat date=$order->date_add full=0}
		</p>
	</div>
</form>

<div class="info-order">
{if $carrier->id}<p><strong>{l s='Carrier:' mod='germanext'}</strong> {if $carrier->name == "0"}{$shop_name|escape:'htmlall':'UTF-8'}{else}{$carrier->name|escape:'htmlall':'UTF-8'}{/if}</p>{/if}
<p><strong>{l s='Payment method:' mod='germanext'}</strong> <span class="color-myaccount">{$order->payment|escape:'htmlall':'UTF-8'}</span></p>
{if $invoice AND $invoiceAllowed}
<p>
	<img src="{$img_dir}icon/pdf.gif" alt="" class="icon" />
	<a href="{$link->getPageLink('pdf-invoice.php', true)}?id_order={$order->id|intval}{if $is_guest}&secure_key={$order->secure_key}{/if}">{l s='Download your invoice as a PDF file' mod='germanext'}</a>
</p>
{/if}
{if $order->recyclable}
<p><img src="{$img_dir}icon/recyclable.gif" alt="" class="icon" />&nbsp;{l s='You have given permission to receive your order in recycled packaging.' mod='germanext'}</p>
{/if}
{if $order->gift}
	<p><img src="{$img_dir}icon/gift.gif" alt="" class="icon" />&nbsp;{l s='You requested gift-wrapping for your order.' mod='germanext'}</p>
	<p>{l s='Message:' mod='germanext'} {$order->gift_message|nl2br}</p>
{/if}
</div>

{if count($order_history)}
<h3>{l s='Follow your order step-by-step' mod='germanext'}</h3>
<div class="table_block">
	<table class="detail_step_by_step std">
		<thead>
			<tr>
				<th class="first_item">{l s='Date' mod='germanext'}</th>
				<th class="last_item">{l s='Status' mod='germanext'}</th>
			</tr>
		</thead>
		<tbody>
		{foreach from=$order_history item=state name="orderStates"}
			<tr class="{if $smarty.foreach.orderStates.first}first_item{elseif $smarty.foreach.orderStates.last}last_item{/if} {if $smarty.foreach.orderStates.index % 2}alternate_item{else}item{/if}">
				<td>{dateFormat date=$state.date_add full=1}</td>
				<td>{$state.ostate_name|escape:'htmlall':'UTF-8'}</td>
			</tr>
		{/foreach}
		</tbody>
	</table>
</div>
{/if}

{if isset($followup)}
<p class="bold">{l s='Click the following link to track the delivery of your order' mod='germanext'}</p>
<a href="{$followup|escape:'htmlall':'UTF-8'}">{$followup|escape:'htmlall':'UTF-8'}</a>
{/if}

<div class="adresses_bloc clearfix">
<p class="bold">{l s='Order:' mod='germanext'} <span class="color-myaccount">{l s='#' mod='germanext'}{$order->id|string_format:"%06d"}</span></p>
{if $carrier->id}<p class="bold">{l s='Carrier:' mod='germanext'} {if $carrier->name == "0"}{$shop_name|escape:'htmlall':'UTF-8'}{else}{$carrier->name|escape:'htmlall':'UTF-8'}{/if}</p>{/if}
<p class="bold">{l s='Payment method:' mod='germanext'} <span class="color-myaccount">{$order->payment|escape:'htmlall':'UTF-8'}</span></p>
{if $invoice AND $invoiceAllowed}
<p>
	<img src="{$img_dir}icon/pdf.gif" alt="" class="icon" />
	<a target="_blank" href="{$link->getPageLink('pdf-invoice', true)}?id_order={$order->id|intval}{if $is_guest}&secure_key={$order->secure_key}{/if}">{l s='Download your invoice as a PDF file' mod='germanext'}</a>
</p>
{/if}
{if $order->gift}
	<p><img src="{$img_dir}icon/gift.gif" alt="" class="icon" />&nbsp;{l s='You requested gift-wrapping for your order.' mod='germanext'}</p>
	<p>{l s='Message:' mod='germanext'} {$order->gift_message|nl2br}</p>
{/if}
<br />
<ul class="address item" {if $order->isVirtual()}style="display:none;"{/if}>
	<li class="address_title">{l s='Invoice' mod='germanext'}</li>
	{foreach from=$inv_adr_fields name=inv_loop item=field_item}
		{if $field_item eq "company" && isset($address_invoice->company)}<li class="address_company">{$address_invoice->company|escape:'htmlall':'UTF-8'}</li>
		{elseif $field_item eq "address2" && $address_invoice->address2}<li class="address_address2">{$address_invoice->address2|escape:'htmlall':'UTF-8'}</li>
		{elseif $field_item eq "phone_mobile" && $address_invoice->phone_mobile}<li class="address_phone_mobile">{$address_invoice->phone_mobile|escape:'htmlall':'UTF-8'}</li>
		{else}
				{assign var=address_words value=" "|explode:$field_item}
				<li>{foreach from=$address_words item=word_item name="word_loop"}{if !$smarty.foreach.word_loop.first} {/if}<span class="address_{$word_item}">{$invoiceAddressFormatedValues[$word_item]|escape:'htmlall':'UTF-8'}</span>{/foreach}</li>
		{/if}

	{/foreach}
</ul>
<ul class="address alternate_item {if $order->isVirtual()}full_width{/if}">
	<li class="address_title">{l s='Delivery' mod='germanext'}</li>
	{foreach from=$dlv_adr_fields name=dlv_loop item=field_item}
		{if $field_item eq "company" && isset($address_delivery->company)}<li class="address_company">{$address_delivery->company|escape:'htmlall':'UTF-8'}</li>
		{elseif $field_item eq "address2" && $address_delivery->address2}<li class="address_address2">{$address_delivery->address2|escape:'htmlall':'UTF-8'}</li>
		{elseif $field_item eq "phone_mobile" && $address_delivery->phone_mobile}<li class="address_phone_mobile">{$address_delivery->phone_mobile|escape:'htmlall':'UTF-8'}</li>
		{else}
				{assign var=address_words value=" "|explode:$field_item} 
				<li>{foreach from=$address_words item=word_item name="word_loop"}{if !$smarty.foreach.word_loop.first} {/if}<span class="address_{$word_item}">{$deliveryAddressFormatedValues[$word_item]|escape:'htmlall':'UTF-8'}</span>{/foreach}</li>
		{/if}
	{/foreach}
</ul>
</div>
{$HOOK_ORDERDETAILDISPLAYED}
{if !$is_guest}<form action="{$link->getPageLink('order-follow', true)}" method="post">{/if}
<div id="order-detail-content" class="table_block">
	<table class="std">
		<thead>
			<tr>
				{if $return_allowed}<th class="first_item"><input type="checkbox" /></th>{/if}
				<th class="{if $return_allowed}item{else}first_item{/if}">{l s='Reference' mod='germanext'}</th>
				<th class="item">{l s='Product' mod='germanext'}</th>
				<th class="item">{l s='Quantity' mod='germanext'}</th>
				<th class="item">{l s='Unit price' mod='germanext'}</th>
				<th class="last_item">{l s='Total price' mod='germanext'}</th>
			</tr>
		</thead>
		<tfoot>
			{if $priceDisplay && $use_tax}
				<tr class="item">
					<td colspan="{if $return_allowed}6{else}5{/if}">
						{l s='Total products (tax excl.):' mod='germanext'} <span class="price">{displayWtPriceWithCurrency price=$order->getTotalProductsWithoutTaxes() currency=$currency}</span>
					</td>
				</tr>
			{/if}
			<tr class="item">
				<td colspan="{if $return_allowed}6{else}5{/if}">
					{l s='Total products' mod='germanext'} {if $use_tax}{l s='(tax incl.)' mod='germanext'}{/if}: <span class="price">{displayWtPriceWithCurrency price=$order->getTotalProductsWithTaxes() currency=$currency}</span>
				</td>
			</tr>
			{if $order->total_discounts > 0}
			<tr class="item">
				<td colspan="{if $return_allowed}6{else}5{/if}">
					{l s='Total vouchers:' mod='germanext'} <span class="price-discount">{displayWtPriceWithCurrency price=$order->total_discounts currency=$currency convert=1}</span>
				</td>
			</tr>
			{/if}
			{if $order->total_wrapping > 0}
			<tr class="item">
				<td colspan="{if $return_allowed}6{else}5{/if}">
					{l s='Total gift-wrapping:' mod='germanext'} <span class="price-wrapping">{displayWtPriceWithCurrency price=$order->total_wrapping currency=$currency}</span>
				</td>
			</tr>
			{/if}
			<tr class="item">
				<td colspan="{if $return_allowed}6{else}5{/if}">
					{l s='Total shipping' mod='germanext'} {if $use_tax}{l s='(tax incl.)' mod='germanext'}{/if}: <span class="price-shipping">{displayWtPriceWithCurrency price=$order->total_shipping currency=$currency}</span>
				</td>
			</tr>
			<tr class="item">
				<td colspan="{if $return_allowed}6{else}5{/if}">
					{l s='Total payment' mod='germanext'} {if $use_tax}{l s='(tax incl.)' mod='germanext'}{/if}:
					<ul id="order_payments">
					{if $payments && $payments|@count > 0}
						{foreach from=$payments item=payment}
						<li><span class="module_name">{$payment->payment_message}:</span> <span class="price">{if $use_tax}{displayWtPriceWithCurrency price=$payment->total_payment_tax_incl currency=$currency}{else}{displayWtPriceWithCurrency price=$payment->total_payment_tax_excl currency=$currency}{/if}</span></li>
						{/foreach}
					{else}
						<li><span class="module_name">{$order->payment_message}:</span> <span class="price">{if $use_tax}{displayWtPriceWithCurrency price=$order->total_payment_tax_incl currency=$currency}{else}{displayWtPriceWithCurrency price=$order->total_payment_tax_excl currency=$currency}{/if}</span></li>
					{/if}
					</ul>
				</td>
			</tr>
			<tr class="totalprice item">
				<td colspan="{if $return_allowed}6{else}5{/if}">
					{l s='Total:' mod='germanext'} <span class="price">{displayWtPriceWithCurrency price=$order->total_paid currency=$currency}</span>
				</td>
			</tr>
		</tfoot>
		<tbody>
		{foreach from=$products item=product name=products}
			{if !isset($product.deleted)}
				{assign var='productId' value=$product.product_id}
				{assign var='productAttributeId' value=$product.product_attribute_id}
				{if isset($product.customizedDatas)}
					{assign var='productQuantity' value=$product.product_quantity-$product.customizationQuantityTotal}
				{else}
					{assign var='productQuantity' value=$product.product_quantity}
				{/if}
				<!-- Customized products -->
				{if isset($product.customizedDatas)}
					<tr class="item">
						{if $return_allowed}<td class="order_cb"></td>{/if}
						<td><label for="cb_{$product.id_order_detail|intval}">{if $product.product_reference}{$product.product_reference|escape:'htmlall':'UTF-8'}{else}--{/if}</label></td>
						<td class="bold">
							<label for="cb_{$product.id_order_detail|intval}">{$product.product_name|escape:'htmlall':'UTF-8'}</label>
						</td>
						<td><input class="order_qte_input"  name="order_qte_input[{$smarty.foreach.products.index}]" type="text" size="2" value="{$product.customizationQuantityTotal|intval}" /><label for="cb_{$product.id_order_detail|intval}"><span class="order_qte_span editable">{$product.customizationQuantityTotal|intval}</span></label></td>
						<td>
							<label for="cb_{$product.id_order_detail|intval}">
								{if $group_use_tax}
									{convertPriceWithCurrency price=$product.unit_price_tax_incl currency=$currency}
								{else}
									{convertPriceWithCurrency price=$product.unit_price_tax_excl currency=$currency}
								{/if}
							</label>
						</td>
						<td>
							<label for="cb_{$product.id_order_detail|intval}">
								{if isset($customizedDatas.$productId.$productAttributeId)}
									{if $group_use_tax}
										{convertPriceWithCurrency price=$product.total_customization_wt currency=$currency}
									{else}
										{convertPriceWithCurrency price=$product.total_customization currency=$currency}
									{/if}
								{else}
									{if $group_use_tax}
										{convertPriceWithCurrency price=$product.total_price_tax_incl currency=$currency}
									{else}
										{convertPriceWithCurrency price=$product.total_price_tax_excl currency=$currency}
									{/if}
								{/if}
							</label>
						</td>
					</tr>
					{foreach from=$product.customizedDatas item='customization' key='customizationId'}
					<tr class="alternate_item">
						{if $return_allowed}<td class="order_cb"><input type="checkbox" id="cb_{$product.id_order_detail|intval}" name="customization_ids[{$product.id_order_detail|intval}][]" value="{$customizationId|intval}" /></td>{/if}
						<td colspan="2">
						{foreach from=$customization.datas key='type' item='datas'}
							{if $type == $CUSTOMIZE_FILE}
							<ul class="customizationUploaded">
								{foreach from=$datas item='data'}
									<li><img src="{$pic_dir}{$data.value}_small" alt="" class="customizationUploaded" /></li>
								{/foreach}
							</ul>
							{elseif $type == $CUSTOMIZE_TEXTFIELD}
							<ul class="typedText">{counter start=0 print=false}
								{foreach from=$datas item='data'}
									{assign var='customizationFieldName' value="Text #"|cat:$data.id_customization_field}
									<li>{$data.name|default:$customizationFieldName}{l s=':' mod='germanext'} {$data.value}</li>
								{/foreach}
							</ul>
							{/if}
						{/foreach}
						</td>
						<td>
							<input class="order_qte_input" name="customization_qty_input[{$customizationId|intval}]" type="text" size="2" value="{$customization.quantity|intval}" /><label for="cb_{$product.id_order_detail|intval}"><span class="order_qte_span editable">{$customization.quantity|intval}</span></label>
						</td>
						<td colspan="2"></td>
					</tr>
					{/foreach}
				{/if}
				<!-- Classic products -->
				{if $product.product_quantity > $product.customizationQuantityTotal}
					<tr class="item">
						{if $return_allowed}<td class="order_cb"><input type="checkbox" id="cb_{$product.id_order_detail|intval}" name="ids_order_detail[{$product.id_order_detail|intval}]" value="{$product.id_order_detail|intval}" /></td>{/if}
						<td><label for="cb_{$product.id_order_detail|intval}">{if $product.product_reference}{$product.product_reference|escape:'htmlall':'UTF-8'}{else}--{/if}</label></td>
						<td class="bold">
							<label for="cb_{$product.id_order_detail|intval}">
								{if $product.download_hash && $invoice && $product.display_filename != ''}
									{if isset($is_guest) && $is_guest}
									<a href="{$link->getPageLink('get-file', true, NULL, "key={$product.filename|escape:'htmlall':'UTF-8'}-{$product.download_hash|escape:'htmlall':'UTF-8'}&amp;id_order={$order->id}&secure_key={$order->secure_key}")}" title="{l s='download this product' mod='germanext'}">
									{else}
										<a href="{$link->getPageLink('get-file', true, NULL, "key={$product.filename|escape:'htmlall':'UTF-8'}-{$product.download_hash|escape:'htmlall':'UTF-8'}")}" title="{l s='download this product' mod='germanext'}">
									{/if}
										<img src="{$img_dir}icon/download_product.gif" class="icon" alt="{l s='Download product' mod='germanext'}" />
									</a>
									{if isset($is_guest) && $is_guest}
										<a href="{$link->getPageLink('get-file', true, NULL, "key={$product.filename|escape:'htmlall':'UTF-8'}-{$product.download_hash|escape:'htmlall':'UTF-8'}&id_order={$order->id}&secure_key={$order->secure_key}")}" title="{l s='download this product' mod='germanext'}"> {$product.product_name|escape:'htmlall':'UTF-8'} 	</a>
									{else}
									<a href="{$link->getPageLink('get-file', true, NULL, "key={$product.filename|escape:'htmlall':'UTF-8'}-{$product.download_hash|escape:'htmlall':'UTF-8'}")}" title="{l s='download this product' mod='germanext'}"> {$product.product_name|escape:'htmlall':'UTF-8'} 	</a>
									{/if}
								{else}
									{$product.product_name|escape:'htmlall':'UTF-8'}
								{/if}
							</label>
						</td>
						<td><input class="order_qte_input" name="order_qte_input[{$product.id_order_detail|intval}]" type="text" size="2" value="{$productQuantity|intval}" /><label for="cb_{$product.id_order_detail|intval}"><span class="order_qte_span editable">{$productQuantity|intval}</span></label></td>
						<td>
							<label for="cb_{$product.id_order_detail|intval}">
							{if $group_use_tax}
								{convertPriceWithCurrency price=$product.unit_price_tax_incl currency=$currency}
							{else}
								{convertPriceWithCurrency price=$product.unit_price_tax_excl currency=$currency}
							{/if}
							</label>
						</td>
						<td>
							<label for="cb_{$product.id_order_detail|intval}">
							{if $group_use_tax}
								{convertPriceWithCurrency price=$product.total_price_tax_incl currency=$currency}
							{else}
								{convertPriceWithCurrency price=$product.total_price_tax_excl currency=$currency}
							{/if}
							</label>
						</td>
					</tr>
				{/if}
			{/if}
		{/foreach}
		{foreach from=$discounts item=discount}
			<tr class="item">
				<td>{$discount.name|escape:'htmlall':'UTF-8'}</td>
				<td>{l s='Voucher:' mod='germanext'} {$discount.name|escape:'htmlall':'UTF-8'}</td>
				<td><span class="order_qte_span editable">1</span></td>
				<td>&nbsp;</td>
				<td>{if $discount.value != 0.00}{l s='-' mod='germanext'}{/if}{convertPriceWithCurrency price=$discount.value currency=$currency}</td>
				{if $return_allowed}
				<td>&nbsp;</td>
				{/if}
			</tr>
		{/foreach}
		</tbody>
	</table>
</div>
<div class="table_block">
{if $order->getShipping()|count > 0}
	<table class="std">
		<thead>
			<tr>
				<th class="first_item">{l s='Date' mod='germanext'}</th>
				<th class="item">{l s='Carrier' mod='germanext'}</th>
				<th class="item">{l s='Weight' mod='germanext'}</th>
				<th class="item">{l s='Shipping cost' mod='germanext'}</th>
				<th class="last_item">{l s='Tracking number' mod='germanext'}</th>
			</tr>
		</thead>
		<tbody>
			{foreach from=$order->getShipping() item=line}
			<tr class="item">
				<td>{$line.date_add}</td>
				<td>{$line.state_name}</td>
				<td>{$line.weight|string_format:"%.3f"} {Configuration::get('PS_WEIGHT_UNIT')}</td>
				<td>{if $order->getTaxCalculationMethod() == $smarty.const.PS_TAX_INC}{displayPrice price=$line.shipping_cost_tax_incl currency=$currency->id}{else}{displayPrice price=$line.shipping_cost_tax_excl currency=$currency->id}{/if}</td>
				<td>
					<span id="shipping_number_show">{if $line.url && $line.tracking_number}<a href="{$line.url|replace:'@':$line.tracking_number}">{$line.tracking_number}</a>{else}{$line.tracking_number}{/if}</span>
				</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
{/if}
</div>
<br />
{if !$is_guest}
	{if $return_allowed}
	<div id="returnOrderMessage">
		<h3>{l s='Merchandise return' mod='germanext'}</h3>
		<p>{l s='If you wish to return one or more products, please mark the corresponding boxes and provide an explanation for the return. Then click the button below.' mod='germanext'}</p>
		<p class="textarea">
			<textarea cols="67" rows="3" name="returnText"></textarea>
		</p>
		<p class="submit">
			<input type="submit" value="{l s='Make an RMA slip' mod='germanext'}" name="submitReturnMerchandise" class="button_large" />
			<input type="hidden" class="hidden" value="{$order->id|intval}" name="id_order" />
		</p>
	</div>
	<br />
	{/if}
	</form>

	{if count($messages)}
	<h3>{l s='Messages' mod='germanext'}</h3>
	<div class="table_block">
		<table class="detail_step_by_step std">
			<thead>
				<tr>
					<th class="first_item" style="width:150px;">{l s='From' mod='germanext'}</th>
					<th class="last_item">{l s='Message' mod='germanext'}</th>
				</tr>
			</thead>
			<tbody>
			{foreach from=$messages item=message name="messageList"}
				<tr class="{if $smarty.foreach.messageList.first}first_item{elseif $smarty.foreach.messageList.last}last_item{/if} {if $smarty.foreach.messageList.index % 2}alternate_item{else}item{/if}">
					<td>
						{if isset($message.ename) && $message.ename}
							{$message.efirstname|escape:'htmlall':'UTF-8'} {$message.elastname|escape:'htmlall':'UTF-8'}
						{elseif $message.clastname}
							{$message.cfirstname|escape:'htmlall':'UTF-8'} {$message.clastname|escape:'htmlall':'UTF-8'}
						{else}
							<b>{$shop_name|escape:'htmlall':'UTF-8'}</b>
						{/if}
						<br />
						{dateFormat date=$message.date_add full=1}
					</td>
					<td>{$message.message|nl2br}</td>
				</tr>
			{/foreach}
			</tbody>
		</table>
	</div>
	{/if}
	{if isset($errors) && $errors}
		<div class="error">
			<p>{if $errors|@count > 1}{l s='There are' mod='germanext'}{else}{l s='There is' mod='germanext'}{/if} {$errors|@count} {if $errors|@count > 1}{l s='errors' mod='germanext'}{else}{l s='error' mod='germanext'}{/if} :</p>
			<ol>
			{foreach from=$errors key=k item=error}
				<li>{$error}</li>
			{/foreach}
			</ol>
		</div>
	{/if}
	<form action="{$link->getPageLink('order-detail', true)}" method="post" class="std" id="sendOrderMessage">
		<h3>{l s='Add a message:' mod='germanext'}</h3>
		<p>{l s='If you would like to add a comment about your order, please write it below.' mod='germanext'}</p>
		<p>
		<label for="id_product">{l s='Product' mod='germanext'}</label>
			<select name="id_product" style="width:300px;">
				<option value="0">{l s='-- Choose --' mod='germanext'}</option>
				{foreach from=$products item=product name=products}
					<option value="{$product.product_id}">{$product.product_name}</option>
				{/foreach}
			</select>
		</p>
		<p class="textarea">
			<textarea cols="67" rows="3" name="msgText"></textarea>
		</p>
		<p class="submit">
			<input type="hidden" name="id_order" value="{$order->id|intval}" />
			<input type="submit" class="button" name="submitMessage" value="{l s='Send' mod='germanext'}"/>
		</p>
	</form>
{else}
<p><img src="{$img_dir}icon/infos.gif" alt="" class="icon" />&nbsp;{l s='You cannot make a merchandise return with a guest account' mod='germanext'}</p>
{/if}
