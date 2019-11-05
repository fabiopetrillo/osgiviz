package de.cau.cs.kieler.osgiviz

import com.google.inject.Inject
import de.cau.cs.kieler.klighd.ViewContext
import de.cau.cs.kieler.klighd.kgraph.KEdge
import de.cau.cs.kieler.klighd.kgraph.KNode
import de.cau.cs.kieler.klighd.kgraph.KPort
import de.cau.cs.kieler.klighd.krendering.Arc
import de.cau.cs.kieler.klighd.krendering.KArc
import de.cau.cs.kieler.klighd.krendering.KContainerRendering
import de.cau.cs.kieler.klighd.krendering.KEllipse
import de.cau.cs.kieler.klighd.krendering.KPolyline
import de.cau.cs.kieler.klighd.krendering.KRectangle
import de.cau.cs.kieler.klighd.krendering.KRoundedRectangle
import de.cau.cs.kieler.klighd.krendering.KText
import de.cau.cs.kieler.klighd.krendering.LineStyle
import de.cau.cs.kieler.klighd.krendering.ModifierState
import de.cau.cs.kieler.klighd.krendering.ViewSynthesisShared
import de.cau.cs.kieler.klighd.krendering.extensions.KColorExtensions
import de.cau.cs.kieler.klighd.krendering.extensions.KContainerRenderingExtensions
import de.cau.cs.kieler.klighd.krendering.extensions.KEdgeExtensions
import de.cau.cs.kieler.klighd.krendering.extensions.KLabelExtensions
import de.cau.cs.kieler.klighd.krendering.extensions.KPolylineExtensions
import de.cau.cs.kieler.klighd.krendering.extensions.KRenderingExtensions
import de.scheidtbachmann.osgimodel.Bundle
import de.scheidtbachmann.osgimodel.Feature
import de.scheidtbachmann.osgimodel.PackageObject
import de.scheidtbachmann.osgimodel.Product
import de.scheidtbachmann.osgimodel.Reference
import de.scheidtbachmann.osgimodel.ServiceComponent
import de.scheidtbachmann.osgimodel.ServiceInterface
import de.cau.cs.kieler.osgiviz.actions.ConnectAllAction
import de.cau.cs.kieler.osgiviz.actions.ContextCollapseExpandAction
import de.cau.cs.kieler.osgiviz.actions.ContextExpandAllAction
import de.cau.cs.kieler.osgiviz.actions.ContextRemoveAction
import de.cau.cs.kieler.osgiviz.actions.FocusAction
import de.cau.cs.kieler.osgiviz.actions.OverviewContextCollapseExpandAction
import de.cau.cs.kieler.osgiviz.actions.RevealImplementedServiceInterfacesAction
import de.cau.cs.kieler.osgiviz.actions.RevealImplementingServiceComponentsAction
import de.cau.cs.kieler.osgiviz.actions.RevealReferencedServiceInterfacesAction
import de.cau.cs.kieler.osgiviz.actions.RevealReferencingServiceComponentsAction
import de.cau.cs.kieler.osgiviz.actions.RevealRequiredBundlesAction
import de.cau.cs.kieler.osgiviz.actions.RevealUsedByBundlesAction
import de.cau.cs.kieler.osgiviz.actions.RevealUsedPackagesAction
import de.cau.cs.kieler.osgiviz.actions.SelectRelatedAction
import java.util.List

import static de.cau.cs.kieler.osgiviz.OsgiOptions.*

import static extension de.cau.cs.kieler.klighd.microlayout.PlacementUtil.*
import static extension de.cau.cs.kieler.klighd.syntheses.DiagramSyntheses.*

/**
 * The renderings and styles of OsgiModels.
 * 
 * @author nre
 */
@ViewSynthesisShared
class OsgiStyles {
    @Inject extension KColorExtensions
    @Inject extension KContainerRenderingExtensions
    @Inject extension KEdgeExtensions
    @Inject extension KLabelExtensions
    @Inject extension KPolylineExtensions
    @Inject extension KRenderingExtensions
    
    // The colors used for the background of all visualized elements.
    public static final String BUNDLE_COLOR_1            = "#E0F7FF" // HSV 195 12 100
    public static final String BUNDLE_COLOR_2            = "#C2F0FF" // HSV 195 24 100
    public static final String EXTERNAL_BUNDLE_COLOR_1   = "#F7FDFF" // HSV 195 3 100
    public static final String EXTERNAL_BUNDLE_COLOR_2   = "#F0FBFF" // HSV 195 6 100
    public static final String FEATURE_COLOR_1           = "#E0FFE9" // HSV 137 12 100
    public static final String FEATURE_COLOR_2           = "#C2FFD3" // HSV 137 24 100
    public static final String EXTERNAL_FEATURE_COLOR_1  = "#F7FFFA" // HSV 137 3 100
    public static final String EXTERNAL_FEATURE_COLOR_2  = "#F0FFF4" // HSV 137 6 100
    public static final String PACKAGE_OBJECT_COLOR_1    = "#E7E0FF" // HSV 253 12 100
    public static final String PACKAGE_OBJECT_COLOR_2    = "#CFC2FF" // HSV 253 24 100
    public static final String PRODUCT_COLOR_1           = "#FFEAE0" // HSV 19 12 100
    public static final String PRODUCT_COLOR_2           = "#FFD5C2" // HSV 19 24 100
    public static final String SERVICE_COMPONENT_COLOR_1 = "#FFE0F5" // HSV 319 12 100
    public static final String SERVICE_COMPONENT_COLOR_2 = "#FFC2EC" // HSV 319 24 100
    public static final String SERVICE_INTERFACE_COLOR_1 = "#FFE0E0" // HSV 0 12 100
    public static final String SERVICE_INTERFACE_COLOR_2 = "#FFC2C2" // HSV 0 24 100
    
    // Port colors.
    public static final String ALL_SHOWN_COLOR = "white"
    public static final String NOT_ALL_SHOWN_COLOR = "black"
    
    public static final String SHADOW_COLOR = "black"
    
    // Edge colors.
    public static final String SELECTION_COLOR = "blue"
    
    /** The roundness of visualized rounded rectangles. */
    static final int ROUNDNESS = 4
    
    // ------------------------------------- Generic renderings -------------------------------------
    
    /**
     * Sets the selection style of the node.
     */
    def setSelectionStyle(KContainerRendering rendering) {
        rendering => [
            selectionLineWidth = 3 * lineWidthValue;
            selectionForeground = SELECTION_COLOR.color;
        ]
    }
    
    /**
     * Adds a simple rendering for any named OSGi element to the given node.
     */
    def KRoundedRectangle addGenericRendering(KNode node, String name) {
        node.addRoundedRectangle(ROUNDNESS, ROUNDNESS) => [
            setShadow(SHADOW_COLOR.color, 4, 4)
            addSimpleLabel(name)
            setSelectionStyle
        ]
    }
    
    /**
     * Adds a rendering allowing a container rendering for any context with the given text as its headline.
     */
    def void addOverviewRendering(KNode node, String headlineText, String tooltipText) {
        // Expanded
        node.addRoundedRectangle(ROUNDNESS, ROUNDNESS) => [
            setAsExpandedView
            setGridPlacement(1)
            addDoubleClickAction(OverviewContextCollapseExpandAction.ID)
            addRectangle => [
                setGridPlacement(9)
                invisible = true
                addRectangle => [
                    invisible = true
                    addSimpleLabel(headlineText)
                ]
                addVerticalLine
                addFocusButton
                addVerticalLine
                addExpandAllButton
                addVerticalLine
                addConnectAllButton
                addVerticalLine
                addOverviewContextCollapseExpandButton(false)
            ]
            addHorizontalSeperatorLine(1, 0)
            addChildArea
            setShadow(SHADOW_COLOR.color, 4, 4)
            tooltip = tooltipText
            setSelectionStyle
        ]
        
        // Collapsed
        node.addRoundedRectangle(ROUNDNESS, ROUNDNESS) => [
            setAsCollapsedView
            setGridPlacement(1)
            addDoubleClickAction(OverviewContextCollapseExpandAction.ID)
            addRectangle => [
                setGridPlacement(3)
                invisible = true
                addRectangle => [
                    invisible = true
                    addSimpleLabel(headlineText)
                ]
                addVerticalLine
                addOverviewContextCollapseExpandButton(true)
            ]
            setShadow(SHADOW_COLOR.color, 4, 4)
            tooltip = tooltipText
            setSelectionStyle
        ]
    }
    
    /**
     * Adds a vertical line without flexible width into a grid placement.
     * 
     * @param container The parent rendering this button should be added to.
     */
    
    def KPolyline addVerticalLine(KContainerRendering container) {
        container.addVerticalLine(RIGHT, 0, 1) => [
            setGridPlacementData => [
                flexibleWidth = false
            ]
        ]
    }
    
    /**
     * Adds a button in the top right corner of any container rendering that will cause an action to be called.
     * 
     * @param container The parent rendering this button should be added to.
     * @param text The text that should be displayed on the button.
     * @param actionId The id of the action that should be called if the button is clicked.
     */
    def KRectangle addButton(KContainerRendering container, String text, String actionId) {
        return container.addRectangle => [
            setPointPlacementData(RIGHT, 0, 0,  TOP, 0, 0, H_RIGHT, V_TOP, 0, 0, 15, 15)
            addSingleOrMultiClickAction(actionId)
            addText(text) => [
                suppressSelectability
                fontSize = 8
                fontBold = true
                selectionFontBold = true
                val size = estimateTextSize
                setPointPlacementData(RIGHT, 0, 0.5f, TOP, 0, 0.5f, H_CENTRAL, V_CENTRAL, 4f, 4f, size.width, size.height)
                addSingleOrMultiClickAction(actionId)
            ]
        ]
    }
    
    /**
     * Adds a button in a grid placement rendering that causes the {@link ContextCollapseAction} to be called.
     * 
     * @param container The parent rendering this button should be added to.
     * @param expand Whether this button should expand or collapse. {@code true} for expanding, {@code false} for
     * collapsing.
     */
    def KRectangle addCollapseExpandButton(KContainerRendering container, boolean expand) {
        val label = if (expand) "+" else "-"
        val doWhat = if (expand) "Expand" else "Collapse"
        return container.addButton(label, ContextCollapseExpandAction::ID) => [
            setGridPlacementData => [
                flexibleWidth = false
            ]
            lineWidth = 0
            tooltip = doWhat + " this element."
        ]
    }
    
    /**
     * Adds a button in a grid placement rendering that causes the {@link ContextExpandAllAction} to be called.
     * 
     * @param container The parent rendering this button should be added to.
     */
    def KRectangle addExpandAllButton(KContainerRendering container) {
        return container.addButton("Expand all", ContextExpandAllAction::ID) => [
            setGridPlacementData => [
                flexibleWidth = false
            ]
            lineWidth = 0
            tooltip = "Expand all elements in this overview."
        ]
    }
    
    /**
     * Adds a button in a grid placement rendering that causes the {@link ConnectAllAction} to be called.
     * 
     * @param container The parent rendering this button should be added to.
     */
    def KRectangle addConnectAllButton(KContainerRendering container) {
        return container.addButton("Connect all", ConnectAllAction::ID) => [
            setGridPlacementData => [
                flexibleWidth = false
            ]
            lineWidth = 0
            tooltip = "Connects all elements in this overview."
        ]
    }
    
    /**
     * Adds a button in a grid placement rendering that causes the {@link ContextRemoveAction} to be called.
     * 
     * @param container The parent rendering this button should be added to.
     */
    def KRectangle addRemoveButton(KContainerRendering container) {
        return container.addButton("x", ContextRemoveAction::ID) => [
            setGridPlacementData => [
                flexibleWidth = false
            ]
            lineWidth = 0
            tooltip = "Remove this element from the view."
        ]
    }
    
    /**
     * Adds a button in a grid placement that causes the {@link OverviewContextCollapseExpandAction} to be called.
     * 
     * @param container The parent rendering this button should be added to.
     * @param expand Whether this button should expand or collapse. {@code true} for expanding, {@code false} for
     * collapsing.
     */
    def KRectangle addOverviewContextCollapseExpandButton(KContainerRendering container, boolean expand) {
        val label = if (expand) "+" else "-"
        val doWhat = if (expand) "Expand" else "Collapse"
        return container.addButton(label, OverviewContextCollapseExpandAction.ID) => [
            setGridPlacementData => [
                flexibleWidth = false
            ]
            lineWidth = 0
            tooltip = doWhat + " this overview."
        ]
    }
    
    /**
     * Adds a button in grid placement that causes the {@link FocusAction} to be called.
     * 
     * @param container The parent rendering this button should be added to.
     */
    def KRectangle addFocusButton(KContainerRendering container) {
        return container.addButton("Focus", FocusAction::ID) => [
            setGridPlacementData => [
                flexibleWidth = false
            ]
            lineWidth = 0
            tooltip = "Focus the view to this overview alone."
        ]
    }
    
    /**
     * Adds a simple text label to any rendering with some surrounding space for better readability.
     */
    def KText addSimpleLabel(KContainerRendering rendering, String text) {
        rendering.addText(text) => [
            // Add surrounding space
            setGridPlacementData().from(LEFT, 10, 0, TOP, 8, 0).to(RIGHT, 10, 0, BOTTOM, 8, 0)
            // Remove the default bold property on selected texts.
            selectionFontBold = false
            suppressSelectability
        ]
    }
    
    // ------------------------------------- Project renderings -------------------------------------
    
    /**
     * Adds the rendering as a project overview.
     */
    def void addProjectRendering(KNode node) {
        node.addRoundedRectangle(ROUNDNESS, ROUNDNESS) => [
            setGridPlacement(1)
            addRectangle => [
                invisible = true
                addSimpleLabel("Overview")
            ]
            addHorizontalSeperatorLine(1, 0)
            addChildArea
            setShadow(SHADOW_COLOR.color, 4, 4)
            tooltip = "The overview of all available views for this OSGi project."
            setSelectionStyle
        ]
    }
    
    // ------------------------------------- Product renderings -------------------------------------
    
    /**
     * Adds a simple rendering for a {@link Product} to the given node that can be expanded to call the
     * {link ReferencedSynthesisExpandAction} to dynamically call the product synthesis for the given product.
     */
    def KRoundedRectangle addProductInOverviewRendering(KNode node, Product p, String name) {
        node.addRoundedRectangle(ROUNDNESS, ROUNDNESS) => [
            setGridPlacement(3)
            addRectangle => [
                invisible = true
                addSimpleLabel(name)
            ]
            addVerticalLine
            addCollapseExpandButton(true)
            setBackgroundGradient(PRODUCT_COLOR_1.color, PRODUCT_COLOR_2.color, 90)
            addDoubleClickAction(ContextCollapseExpandAction::ID)
            addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                ModifierState.NOT_PRESSED)
            setShadow(SHADOW_COLOR.color, 4, 4)
            tooltip = p.uniqueId
            setSelectionStyle
        ]
    }
    
    /**
     * Adds a rendering for a {@link Product} to the given node.
     * Contains the name of the product, a button to focus this product and text for the ID and description of this product.
     * 
     * @param node The KNode this rendering should be attached to.
     * @param p The product this rendering represents.
     * @param context The view context used in the synthesis.
     * 
     * @return The entire rendering for a product.
     */
    def KRoundedRectangle addProductRendering(KNode node, Product p, boolean inOverview, boolean hasChildren,
        ViewContext context) {
        node.addRoundedRectangle(ROUNDNESS, ROUNDNESS) => [
            setBackgroundGradient(PRODUCT_COLOR_1.color, PRODUCT_COLOR_2.color, 90)
            setGridPlacement(1)
            addRectangle => [
                setGridPlacement(3)
                invisible = true
                addRectangle => [
                    invisible = true
                    addSimpleLabel(p.descriptiveName)
                ]
                addVerticalLine
                if (inOverview) {
                    addCollapseExpandButton(false)
                } else {
                    addRemoveButton
                }
            ]
            addHorizontalSeperatorLine(1, 0)
            addRectangle => [
                invisible = true
                addSimpleLabel("ID: " + SynthesisUtils.getId(p.uniqueId, context)) => [
                    tooltip = p.uniqueId
                    addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                        ModifierState.NOT_PRESSED)
                ]
            ]
            if (context.getOptionValue(FILTER_DESCRIPTIONS) as Boolean) {
                addRectangle => [
                    invisible = true
                    addSimpleLabel("Description: " + SynthesisUtils.descriptionLabel(p.about, context)) => [
                        tooltip = p.about
                        addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                            ModifierState.NOT_PRESSED)
                    ]
                ]
            }
            if (hasChildren) {
                addHorizontalSeperatorLine(1, 0)
                addChildArea
            }
            setShadow(SHADOW_COLOR.color, 4, 4)
            addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                ModifierState.NOT_PRESSED)
            setSelectionStyle
        ]
    }
    
    // ------------------------------------- Feature renderings -------------------------------------
    
    /**
     * Adds a simple rendering for a {@link Feature} to the given node that can be expanded to call the
     * {link ReferencedSynthesisExpandAction} to dynamically call the bundle synthesis for the given feature.
     */
    def addFeatureInOverviewRendering(KNode node, Feature f, String label) {
        node.addRoundedRectangle(ROUNDNESS, ROUNDNESS) => [
            setGridPlacement(3)
            addRectangle => [
                invisible = true
                addSimpleLabel(label)
            ]
            addVerticalLine
            addCollapseExpandButton(true)
            if (f.isIsExternal) {
                setBackgroundGradient(EXTERNAL_FEATURE_COLOR_1.color, EXTERNAL_FEATURE_COLOR_2.color, 90)
            } else {
                setBackgroundGradient(FEATURE_COLOR_1.color, FEATURE_COLOR_2.color, 90)
            }
            addDoubleClickAction(ContextCollapseExpandAction::ID)
            addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                ModifierState.NOT_PRESSED)
            setShadow(SHADOW_COLOR.color, 4, 4)
            tooltip = f.uniqueId
            setSelectionStyle
        ]
    }
    
    /**
     * Adds a rendering for a {@link Feature} to the given node.
     * Contains the name of the feature and text for the ID and description of this feature.
     * 
     * @param node The KNode this rendering should be attached to.
     * @param f The feature this rendering represents.
     * @param context The view context used in the synthesis.
     * 
     * @return The entire rendering for a feature.
     */
    def KRoundedRectangle addFeatureRendering(KNode node, Feature f, boolean inOverview, boolean hasChildren,
        ViewContext context) {
        node.addRoundedRectangle(ROUNDNESS, ROUNDNESS) => [
            if (f.isIsExternal) {
                setBackgroundGradient(EXTERNAL_FEATURE_COLOR_1.color, EXTERNAL_FEATURE_COLOR_2.color, 90)
            } else {
                setBackgroundGradient(FEATURE_COLOR_1.color, FEATURE_COLOR_2.color, 90)
            }
            setGridPlacement(1)
            addRectangle => [
                setGridPlacement(3)
                invisible = true
                addRectangle => [
                    invisible = true
                    var String name = ""
                    if (f.isIsExternal) {
                        name += "(External) "
                    }
                    if (f.descriptiveName !== null) {
                        name += f.descriptiveName
                    }
                    addSimpleLabel(name)
                ]
                addVerticalLine
                if (inOverview) {
                    addCollapseExpandButton(false)
                } else {
                    addRemoveButton
                }
            ]
            addHorizontalSeperatorLine(1, 0)
            addRectangle => [
                invisible = true
                addSimpleLabel("ID: " + SynthesisUtils.getId(f.uniqueId, context)) => [
                    tooltip = f.uniqueId
                    addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                        ModifierState.NOT_PRESSED)
                ]
            ]
            if (context.getOptionValue(FILTER_DESCRIPTIONS) as Boolean) {
                addRectangle => [
                    invisible = true
                    addSimpleLabel("Description: " + SynthesisUtils.descriptionLabel(f.about, context)) => [
                        tooltip = f.about
                        addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                            ModifierState.NOT_PRESSED)
                    ]
                ]
            }
            if (hasChildren) {
                addHorizontalSeperatorLine(1, 0)
                addChildArea
            }
            setShadow(SHADOW_COLOR.color, 4, 4)
            addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                ModifierState.NOT_PRESSED)
            setSelectionStyle
        ]
    }
    
    // ------------------------------------- Bundle renderings -------------------------------------
    
    /**
     * Adds a simple rendering for a {@link Bundle} to the given node that can be expanded to call the
     * {link ReferencedSynthesisExpandAction} to dynamically call the bundle synthesis for the given bundle.
     */
    def addBundleInOverviewRendering(KNode node, Bundle b, String label) {
        node.addRoundedRectangle(ROUNDNESS, ROUNDNESS) => [
            setGridPlacement(3)
            addRectangle => [
                invisible = true
                addSimpleLabel(label)
            ]
            addVerticalLine
            addCollapseExpandButton(true)
            if (b.isIsExternal) {
                setBackgroundGradient(EXTERNAL_BUNDLE_COLOR_1.color, EXTERNAL_BUNDLE_COLOR_2.color, 90)
            } else {
                setBackgroundGradient(BUNDLE_COLOR_1.color, BUNDLE_COLOR_2.color, 90)
            }
            addDoubleClickAction(ContextCollapseExpandAction::ID)
            addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                ModifierState.NOT_PRESSED)
            setShadow(SHADOW_COLOR.color, 4, 4)
            tooltip = b.uniqueId
            setSelectionStyle
        ]
    }
    
    /**
     * Adds a rendering for a {@link Bundle} to the given node.
     * Contains the name of the bundle, a button to focus this bundle and text for the ID and description of this bundle.
     * 
     * @param node The KNode this rendering should be attached to.
     * @param b The bundle this rendering represents.
     * @param context The view context used in the synthesis.
     * 
     * @return The entire rendering for a bundle.
     */
    def KRoundedRectangle addBundleRendering(KNode node, Bundle b, boolean inOverview, boolean hasChildren,
        ViewContext context) {
        node.addRoundedRectangle(ROUNDNESS, ROUNDNESS) => [
            if (b.isIsExternal) {
                setBackgroundGradient(EXTERNAL_BUNDLE_COLOR_1.color, EXTERNAL_BUNDLE_COLOR_2.color, 90)
            } else {
                setBackgroundGradient(BUNDLE_COLOR_1.color, BUNDLE_COLOR_2.color, 90)
            }
            setGridPlacement(1)
            addRectangle => [
                setGridPlacement(3)
                invisible = true
                addRectangle => [
                    invisible = true
                    var String name = ""
                    if (b.isIsExternal) {
                        name += "(External) "
                    }
                    if (b.descriptiveName !== null) {
                        name += b.descriptiveName
                    }
                    addSimpleLabel(name)
                ]
                addVerticalLine
                if (inOverview) {
                    addCollapseExpandButton(false)
                } else {
                    addRemoveButton
                }
            ]
            addHorizontalSeperatorLine(1, 0)
            addRectangle => [
                invisible = true
                addSimpleLabel("ID: " + SynthesisUtils.getId(b.uniqueId, context)) => [
                    tooltip = b.uniqueId
                    addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                        ModifierState.NOT_PRESSED)
                ]
            ]
            if (context.getOptionValue(FILTER_DESCRIPTIONS) as Boolean) {
                addRectangle => [
                    invisible = true
                    addSimpleLabel("Description: " + SynthesisUtils.descriptionLabel(b.about, context)) => [
                        tooltip = b.about
                        addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                            ModifierState.NOT_PRESSED)
                    ]
                ]
            }
            if (hasChildren) {
                addHorizontalSeperatorLine(1, 0)
                addChildArea
            }
            setShadow(SHADOW_COLOR.color, 4, 4)
            addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                ModifierState.NOT_PRESSED)
            setSelectionStyle
        ]
    }
    
    /**
     * The rendering of a port that connects the bundles used by this component. Issues the
     * {@link RevealUsedByBundlesAction} if clicked.
     */
    def KRectangle addUsedByBundlesPortRendering(KPort port, int numUsedByBundles, boolean allShown) {
        return port.addRectangle => [
            background = if (allShown) ALL_SHOWN_COLOR.color else NOT_ALL_SHOWN_COLOR.color
            val tooltipText = "Show bundles that require this bundle (" + numUsedByBundles + " total)."
            tooltip = tooltipText
            addSingleClickAction(RevealUsedByBundlesAction::ID)
        ]
    }
    
    /**
     * The rendering of a port that connects the bundles required by this component. Issues the
     * {@link RevealRequiredBundlesAction} if clicked.
     */
    def KRectangle addRequiredBundlesPortRendering(KPort port, int numReqBundles, boolean allShown) {
        return port.addRectangle => [
            background = if (allShown) ALL_SHOWN_COLOR.color else NOT_ALL_SHOWN_COLOR.color
            val tooltipText = "Show required bundles (" + numReqBundles + " total)."
            tooltip = tooltipText
            addSingleClickAction(RevealRequiredBundlesAction::ID)
        ]
    }
    
    /**
     * Adds the rendering for an edge showing a bundle requirement.
     */
    def addRequiredBundleEdgeRendering(KEdge edge) {
        edge.addPolyline => [
            lineWidth = 2
            addHeadArrowDecorator => [
                lineWidth = 1
                background = "black".color
                foreground = "black".color
                selectionLineWidth = 1.5f
                selectionForeground = SELECTION_COLOR.color
                selectionBackground = SELECTION_COLOR.color
                addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                    ModifierState.NOT_PRESSED)
                suppressSelectablility
            ]
            lineStyle = LineStyle.DASH
            selectionLineWidth = 3
            selectionForeground = SELECTION_COLOR.color
            addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                ModifierState.NOT_PRESSED)
        ]
    }
    
    /**
     * Adds the rendering of a port that connects the bundle to the bundles providing its used packages.
     */
    def addUsedPackagesPortRendering(KPort port, boolean allShown) {
        port.addEllipse => [
            background = if (allShown) ALL_SHOWN_COLOR.color else NOT_ALL_SHOWN_COLOR.color
            val tooltipText = "Show the used packages."
            tooltip = tooltipText
            addSingleClickAction(RevealUsedPackagesAction::ID)
        ]
    }
    
    // ------------------------------------- Package renderings -------------------------------------
    
    /**
     * Adds a rendering for a {@link PackageObject} to the given node.
     * 
     * @param node The KNode this rendering should be attached to.
     * @param po The package object this rendering represents.
     * @param context The view context used in the synthesis.
     * 
     * @return The entire rendering for a package object.
     */
    def KRoundedRectangle addPackageObjectRendering(KNode node, PackageObject po, boolean inOverview,
        ViewContext context) {
        node.addRoundedRectangle(ROUNDNESS, ROUNDNESS) => [
            setBackgroundGradient(PACKAGE_OBJECT_COLOR_1.color, PACKAGE_OBJECT_COLOR_2.color, 90)
            setGridPlacement(1)
            addRectangle => [
                setGridPlacement(3)
                invisible = true
                addRectangle => [
                    invisible = true
                    addSimpleLabel(SynthesisUtils.getId(po.uniqueId, context)) => [
                        tooltip = po.uniqueId
                        addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                            ModifierState.NOT_PRESSED)
                    ]
                ]
                addVerticalLine
                if (inOverview) {
                    addCollapseExpandButton(false)
                } else {
                    addRemoveButton
                }
            ]
            setShadow(SHADOW_COLOR.color, 4, 4)
            addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                ModifierState.NOT_PRESSED)
            setSelectionStyle
        ]
    }
    
    /**
     * Adds the rendering for an edge showing a used package with resolved bundle and product.
     * 
     * @param edge The edge this rendering is for.
     * @param packages The used packages shown by this edge.
     * @param product The product in which this connection got resolved.
     * @param context The view context for this visualization.
     */
    def addInternalUsedPackagesBundleEdgeRendering(KEdge edge, List<PackageObject> packages, Product product,
        ViewContext context) {
        var tooltipText_ = "Packages\n" + packages.map [ it.uniqueId + "\n" ]
        if (product !== null) {
            tooltipText_ += " for product " + product.uniqueId
        }
        val tooltipText = tooltipText_
        edge.addPolyline => [
            addHeadArrowDecorator => [
                lineWidth = 1
                background = "black".color
                foreground = "black".color
                selectionLineWidth = 1.5f
                selectionForeground = SELECTION_COLOR.color
                selectionBackground = SELECTION_COLOR.color
                addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                    ModifierState.NOT_PRESSED)
                suppressSelectablility
            ]
            lineStyle = LineStyle.DASH
            tooltip = tooltipText
            selectionLineWidth = 1.5f
            selectionForeground = SELECTION_COLOR.color
            addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                ModifierState.NOT_PRESSED)
        ]
        edge.createLabel => [
            val package_s = if (packages.size === 1) "package" else "packages"
            if (product === null) {
                configureCenterEdgeLabel("(" + packages.size + " " + package_s + ")")
            } else {
                configureCenterEdgeLabel(SynthesisUtils.getId(product.uniqueId, context)
                    + " (" + packages.size + " " + package_s + ")")
            }
            data.filter(KText).forEach [
                addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                    ModifierState.NOT_PRESSED)
            ]
            tooltip = tooltipText
        ]
    }
    
    /**
     * Adds the rendering for an edge showing a used package.
     */
    def addUsedPackagesEdgeRendering(KEdge edge) {
        edge.addPolyline => [
            addHeadArrowDecorator => [
                lineWidth = 1
                background = "black".color
                foreground = "black".color
                selectionLineWidth = 1.5f
                selectionForeground = SELECTION_COLOR.color
                selectionBackground = SELECTION_COLOR.color
                addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                    ModifierState.NOT_PRESSED)
            ]
            lineStyle = LineStyle.DASH
            selectionLineWidth = 1.5f
            selectionForeground = SELECTION_COLOR.color
            addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                ModifierState.NOT_PRESSED)
        ]
    }
    
    // ------------------------------------- ServiceInterface renderings -------------------------------------
    
    /**
     * Adds a simple rendering for a {@link ServiceInterface} to the given node that can be expanded to call the
     * {link ReferencedSynthesisExpandAction} to dynamically call the service interface synthesis for the given bundle.
     */
    def addServiceInterfaceInOverviewRendering(KNode node, ServiceInterface s, String name) {
        node.addRoundedRectangle(ROUNDNESS, ROUNDNESS) => [
            setGridPlacement(3)
            addRectangle => [
                invisible = true
                addSimpleLabel(name)
            ]
            addVerticalLine
            addCollapseExpandButton(true)
            setBackgroundGradient(SERVICE_INTERFACE_COLOR_1.color, SERVICE_INTERFACE_COLOR_2.color, 90)
            addDoubleClickAction(ContextCollapseExpandAction::ID)
            addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                ModifierState.NOT_PRESSED)
            setShadow(SHADOW_COLOR.color, 4, 4)
            tooltip = s.name
            setSelectionStyle
        ]
    }
    
    /**
     * Adds a rendering for a {@link ServiceInterface} to the given node.
     * 
     * @param node The KNode this rendering should be attached to.
     * @param si The service interface this rendering represents.
     * @param context The view context used in the synthesis.
     * 
     * @return The entire rendering for a service interface.
     */
    def KRoundedRectangle addServiceInterfaceRendering(KNode node, ServiceInterface si, boolean inOverview,
        boolean hasChildren, ViewContext context) {
        node.addRoundedRectangle(ROUNDNESS, ROUNDNESS) => [
            setBackgroundGradient(SERVICE_INTERFACE_COLOR_1.color, SERVICE_INTERFACE_COLOR_2.color, 90)
            setGridPlacement(1)
            addRectangle => [
                setGridPlacement(3)
                invisible = true
                addRectangle => [
                    invisible = true
                    addSimpleLabel(SynthesisUtils.getId(si.name, context)) => [
                        tooltip = si.name
                        addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                            ModifierState.NOT_PRESSED)
                    ]
                ]
                addVerticalLine
                if (inOverview) {
                    addCollapseExpandButton(false)
                } else {
                    addRemoveButton
                }
            ]
            if (context.getOptionValue(FILTER_DESCRIPTIONS) as Boolean) {
                addHorizontalSeperatorLine(1, 0)
                addRectangle => [
                    invisible = true
                    addSimpleLabel("Description: " + SynthesisUtils.descriptionLabel(si.about, context)) => [
                        tooltip = si.about
                        addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                            ModifierState.NOT_PRESSED)
                    ]
                ]
            }
            if (hasChildren) {
                addHorizontalSeperatorLine(1, 0)
                addChildArea
            }
            setShadow(SHADOW_COLOR.color, 4, 4)
            addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                ModifierState.NOT_PRESSED)
            setSelectionStyle
        ]
    }
    
    /**
     * The rendering of a port that connects a service interface with the service components implementing it. Issues the
     * {@link RevealImplementingServiceComponentsAction} if clicked.
     * Port rendering is like UML for a component offering an interface:
     * [component]--------o[interface]
     */
    def KEllipse addImplementingServiceComponentsPortRendering(KPort port, int numImplementingComponents, 
       boolean allShown) {
        return port.addEllipse => [
            background = if (allShown) ALL_SHOWN_COLOR.color else NOT_ALL_SHOWN_COLOR.color
            val tooltipText = "Show service components implementing this interface (" + numImplementingComponents
                + " total)."
            tooltip = tooltipText
            addSingleClickAction(RevealImplementingServiceComponentsAction::ID)
        ]
    }
    
    /**
     * The rendering of a port that connects a service interface with the service components referencing it. Issues the
     * {@link RevealReferencingServiceComponentsAction} if clicked.
     * Port rendering is like UML for a component requesting an interface:
     * [component]------C[interface]
     */
    def KArc addReferencingComponentsShownPortRendering(KPort port, int numReferencingComponents,
        boolean allShown) {
        return port.addArc => [
            startAngle = 270
            arcAngle = 180
            arcType = Arc.OPEN
            setAreaPlacementData => [
                topLeft = createKPosition(LEFT, 0, -1, TOP, 0, 0)
            ]
            if (!allShown) {
                background = NOT_ALL_SHOWN_COLOR.color
            }
            val tooltipText = "Show service components referencing this interface (" + numReferencingComponents
                + " total)."
            tooltip = tooltipText
            addSingleClickAction(RevealReferencingServiceComponentsAction::ID)
        ]
    }
    
    // ------------------------------------- ServiceComponent renderings -------------------------------------
    
    /**
     * Adds a simple rendering for a {@link ServiceComponent} to the given node that can be expanded to call the
     * {link ReferencedSynthesisExpandAction} to dynamically call the service component synthesis for the given bundle.
     */
    def addServiceComponentInOverviewRendering(KNode node, ServiceComponent s, String name) {
        node.addRoundedRectangle(ROUNDNESS, ROUNDNESS) => [
            setGridPlacement(3)
            addRectangle => [
                invisible = true
                addSimpleLabel(name)
            ]
            addVerticalLine
            addCollapseExpandButton(true)
            setBackgroundGradient(SERVICE_COMPONENT_COLOR_1.color, SERVICE_COMPONENT_COLOR_2.color, 90)
            addDoubleClickAction(ContextCollapseExpandAction::ID)
            addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                ModifierState.NOT_PRESSED)
            setShadow(SHADOW_COLOR.color, 4, 4)
            tooltip = s.name
            setSelectionStyle
        ]
    }
    
    /**
     * Adds a rendering for a {@link ServiceComponent} to the given node.
     * 
     * @param node The KNode this rendering should be attached to.
     * @param sc The service component this rendering represents.
     * @param context The view context used in the synthesis.
     * 
     * @return The entire rendering for a service component.
     */
    def KRoundedRectangle addServiceComponentRendering(KNode node, ServiceComponent sc, boolean inOverview,
        boolean hasChildren, ViewContext context) {
        node.addRoundedRectangle(ROUNDNESS, ROUNDNESS) => [
            setBackgroundGradient(SERVICE_COMPONENT_COLOR_1.color, SERVICE_COMPONENT_COLOR_2.color, 90)
            setGridPlacement(1)
            addRectangle => [
                setGridPlacement(3)
                invisible = true
                addRectangle => [
                    invisible = true
                    addSimpleLabel(SynthesisUtils.getId(sc.name, context)) => [
                        tooltip = sc.name
                        addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                            ModifierState.NOT_PRESSED)
                    ]
                ]
                addVerticalLine
                if (inOverview) {
                    addCollapseExpandButton(false)
                } else {
                    addRemoveButton
                }
            ]
            if (context.getOptionValue(FILTER_DESCRIPTIONS) as Boolean) {
                addHorizontalSeperatorLine(1, 0)
                addRectangle => [
                    invisible = true
                    addSimpleLabel("Description: " + SynthesisUtils.descriptionLabel(sc.about, context)) => [
                        tooltip = sc.about
                        addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                            ModifierState.NOT_PRESSED)
                    ]
                ]
            }
            if (hasChildren) {
                addHorizontalSeperatorLine(1, 0)
                addChildArea
            }
            setShadow(SHADOW_COLOR.color, 4, 4)
            addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                ModifierState.NOT_PRESSED)
            setSelectionStyle
        ]
    }
    
    /**
     * Adds the rendering for an edge showing an implementation of a service interface by a component.
     */
    def addImplementingComponentEdgeRendering(KEdge edge) {
        edge.addPolyline => [
            lineStyle = LineStyle.DASH
            selectionLineWidth = 1.5f
            selectionForeground = SELECTION_COLOR.color
            addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                ModifierState.NOT_PRESSED)
        ]
    }
    
    /**
     * Adds the rendering for an edge showing a reference of a service interface by a component. That means this edge
     * shows if a component needs another interface's service to work properly.
     * Similar to UML, the multiplicity and reference name is labeled on the edge.
     */
    def addReferencedInterfaceEdgeRendering(KEdge edge, Reference reference, ViewContext usedContext) {
        edge.addPolyline => [
            lineStyle = LineStyle.DASH
            selectionLineWidth = 1.5f
            selectionForeground = SELECTION_COLOR.color
            addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                ModifierState.NOT_PRESSED)
        ]
        if (usedContext.getOptionValue(FILTER_CARDINALITY_LABEL) as Boolean) {
            edge.addTailEdgeLabel(reference.cardinality + "\n" + reference.referenceName) => [
                data.filter(KText).forEach [
                    addSingleClickAction(SelectRelatedAction::ID, ModifierState.NOT_PRESSED, ModifierState.NOT_PRESSED,
                        ModifierState.NOT_PRESSED)
                ]
            ]
        }
    }
    
    /**
     * The rendering of a port that connects a service component with the service interfaces it implements. Issues the
     * {@link RevealImplementedServiceInterfaceAction} if clicked.
     */
    def KRectangle addImplementedServiceInterfacesPortRendering(KPort port, int numImplementedInterfaces,
        boolean allShown) {
        return port.addRectangle => [
            background = if (allShown) ALL_SHOWN_COLOR.color else NOT_ALL_SHOWN_COLOR.color
            val tooltipText = "Show service interfaces implemented by this component (" + numImplementedInterfaces 
                + " total)."
            tooltip = tooltipText
            addSingleClickAction(RevealImplementedServiceInterfacesAction::ID)
        ]
    }
    
    /**
     * The rendering of a port that connects a service component with the service interfaces it references. Issues the
     * {@link RevealReferencedServiceInterfacesAction} if clicked.
     */
    def KRectangle addReferencedServiceInterfacesPortRendering(KPort port, int numReferences, boolean allShown) {
        return port.addRectangle => [
            background = if (allShown) ALL_SHOWN_COLOR.color else NOT_ALL_SHOWN_COLOR.color
            val tooltipText = "Show service interfaces referenced by this component (" + numReferences + " total)."
            tooltip = tooltipText
            addSingleClickAction(RevealReferencedServiceInterfacesAction::ID)
        ]
    }
    
}